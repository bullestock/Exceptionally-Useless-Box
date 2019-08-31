///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// This code is for The Exceptionally Useless Box. Currently set up to be run on an Arduino Pro Mini.
// Written by: Kyle Fitch
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Related project files are hosted on this repository: https://github.com/effequalsemeh/Exceptionally-Useless-Box
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Version History:
// 6-2-19 v0: initial release
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// A note on using this code:
// When I wrote this, I did so in 30 minutes just to get it working. There are far more efficient ways to go about this,
// but this was the quickest and dirtiest way I could get it up and running. When the device is mechanically set up and in
// position, the botAngleMax, botAngleMin, topAngleMax, and topAngleMin need to be tuned to dial in on how hard the arms need
// to press the switch and toggle it over.

#include <Servo.h>
#include <Wire.h>

const int switchPin = 5; // pin that the toggle switch is connected to
Servo topServo; // the "top" servo is the one whose arms extend out of the top lid
Servo botServo; // the "bot" or bottom servo is the one whose arms extend out of the front lid

const int botAngleMax = 168;                 // angle in degrees that the bottom arm will fully extend to
const int botAngleMin = 20;        //  angle in degrees that the bottom arm goes to when fully retracted
const int topAngleMax = 157;                // angle in degrees that the top arm will fully extend to        
const int topAngleMin = 10;               // angle in degrees that the top arm goes to when fully retracted
const int distanceMax = 300;                // the maximum distance away from the sensor that the bottom servo will respond to
const int distanceMin = 70;                // distance at which to press the switch
const float thresholdPercent = 0.93; // percentage of the maximum travel of the bottom arm where the arm should fully commit to pressing the switch
const float threshCommit = thresholdPercent * (botAngleMax - botAngleMin); // the calculated angle when the arm should fully commit to pressing the switch

void console();

void setup() 
{
    Wire.begin();
    Serial.begin(115200);
    Serial.println("Exceptionally Useless Box ready");

    topServo.attach(11);              
    botServo.attach(10);              
    topServo.write(topAngleMin);        // set initial position of the top arm
    botServo.write(botAngleMin);       // set initial position of the bottom arm
    delay(3000);
    pinMode(switchPin, INPUT_PULLUP); // don't forget to put a pull-up resistor on this pin
    Serial.println("Init done");

    if (Serial.available())
    {
       // Command from PC
       char c = Serial.read();
       if ((c == '\r') || (c == '\n'))
           console();
    }

    if (digitalRead(switchPin))
    {
        Serial.println("Switch is on, resetting it");

        topServo.write(topAngleMax); // set position of top arm to hit the switch back off
        while (1)
        {
            if (digitalRead(switchPin) == LOW)
            {
                Serial.println("Turned switch off");
                topServo.write(topAngleMin); // retract the top arm now that the switch is off
                break;
            }
            delay(100);
        }
    }
    Serial.println("Starting the main loop");
}

void resetSwitch()
{
  Serial.println("Resetting switch");
  topServo.write(topAngleMax); // set position of top arm to hit the switch back off
  while (1)
  {
      if (digitalRead(switchPin) == LOW) // check if the switch is off yet
      {
          Serial.println("Switch has been toggled back by the top arm");
          topServo.write(topAngleMin); // retract the top arm now that the switch is off
          break;
      }
      delay(100);
  }
  Serial.println("Switch should be reset now");
}

// Returns distance in mm
int getDistance()
{
    const unsigned char addr = 0;
    const unsigned char cnt = 2;
    // step 1: instruct sensor to read echoes
    Wire.beginTransmission(82); // transmit to device #82 (0x52)
    // the address specified in the datasheet is 164 (0xa4)
    // but i2c adressing uses the high 7 bits so it's 82
    Wire.write(byte(addr));      // sets distance data address (addr)
    Wire.endTransmission();      // stop transmitting
    // step 2: wait for readings to happen
    delay(1);                   // datasheet suggests at least 30uS
    // step 3: request reading from sensor
    Wire.requestFrom(82, cnt);    // request cnt bytes from slave device #82 (0x52)
    // step 5: receive reading from sensor
    if (cnt <= Wire.available()) { // if two bytes were received
        const int msb = Wire.read();
        const int lsb = Wire.read();
        return (msb << 8) + lsb;
    }
    return 0;
}

const int NOF_BINS = 50;
float distances[NOF_BINS];
int cur_bin = 0;
int used_bins = 0;

const float INF_DIST = 1.0e6;

int consecutive_timeouts = 0;
const int MAX_CONSECUTIVE_TIMEOUTS = 2;

int getSmoothedDistance()
{
    const auto d = getDistance();
#if 0
    Serial.print("d "); Serial.println(d);
    bool is_inf = false;
    if (d < 10 || d > 300)
    {
        ++consecutive_timeouts;
        if (consecutive_timeouts > 10)
        {
            Serial.println("Clear bins");
            used_bins = 0;
        }
        if (!used_bins || consecutive_timeouts > MAX_CONSECUTIVE_TIMEOUTS)
        {
            Serial.print("Return INF: ");
            Serial.print(used_bins);
            Serial.print("/");
            Serial.println(consecutive_timeouts);
            return INF_DIST;
        }
        Serial.println("Return old");
        is_inf = true;
    }
    else
    {
        consecutive_timeouts = 0;
        distances[cur_bin] = d;
        if (used_bins < NOF_BINS)
            ++used_bins;
    }
    int bin = cur_bin;
    float sum = 0.0;
    for (int i = 0; i < used_bins; ++i)
    {
        sum += distances[bin++];
        if (bin >= NOF_BINS)
            bin = 0;
    }
    if (!is_inf)
        ++cur_bin;
    if (cur_bin >= NOF_BINS)
        cur_bin = 0;
    const auto sd = used_bins >= NOF_BINS ? sum/used_bins : 0.0;
    Serial.print("sd "); Serial.println(sd);
    return sd;
#else
    return d;
#endif
}

void commit()
{
    Serial.println("Pressing the switch");
    botServo.write(botAngleMax);
    bool switch_on = digitalRead(switchPin);
    while (!switch_on)
    {
        delay(100);
        switch_on = digitalRead(switchPin);
        if (switch_on)
        {
            botServo.write(botAngleMin);
            Serial.println("Switch has been toggled by the bottom arm");
            delay(500);
            break;
        }
    }
    Serial.println("Call resetSwitch");
    resetSwitch();
    for (int i = 0; i < 10; ++i)
    {
        if (getSmoothedDistance() > distanceMin + 50)
            break;
        Serial.println("Wait");
        delay(500);
    }
}

void updateBotArm(float handDistance)
{
    // convert the sensor distance range to the output angle range, but inverted so that the angle goes up as the distance goes down
    float motorPosition = map(handDistance, distanceMin, distanceMax, botAngleMax, botAngleMin);
    Serial.print("Dist ");
    Serial.print(handDistance);
    Serial.print(" -> ");
    Serial.println(motorPosition);
    {
        if (handDistance < distanceMin + 5)
        {
            commit();
        }
        else
        {
            botServo.write(motorPosition);
        }
    }
}

void loop() 
{
    if (digitalRead(switchPin) == HIGH) // check if the switch was changed by the user before the bottom arm could do it
    {
        Serial.println("The switch was toggled before device was able to do it");
        resetSwitch(); 
    }
    float distance = getSmoothedDistance();
    Serial.print("Dist ");
    Serial.println(distance);
    if (distance > 10 && distance < distanceMax) // if the reading is close enough to the device, update the motor position
    {
        updateBotArm(distance);
        delay(15);                                                                                                                                            
    }
    else
    {
        Serial.println("Retract bottom arm");
        botServo.write(botAngleMin); // retract the bottom arm if there's nothing in the way of the sensor
    }
}

const int BUF_SIZE = 200;
int index = 0;
char buffer[BUF_SIZE];

int get_int(const char* buffer, int len)
{
    char intbuf[BUF_SIZE];
    memcpy(intbuf, buffer, max(BUF_SIZE-1, len));
    intbuf[len] = 0;
    return atoi(intbuf);
}

int get_int(const char* buffer, int len, int& next)
{
    int index = 0;
    while (buffer[index] && isspace(buffer[index]) && len)
    {
        ++index;
        --len;
    }
    while (buffer[index] && !isspace(buffer[index]) && len)
    {
        ++index;
        --len;
    }
    char intbuf[BUF_SIZE];
    memcpy(intbuf, buffer, index);
    intbuf[index] = 0;
    next = index+1;
    return atoi(intbuf);
}

bool process(const char* buffer)
{
    int i;
    switch (buffer[0])
    {
    case 't':
    case 'T':
        {
            int index;
            const int value = get_int(buffer+1, BUF_SIZE-1, index); 
            Serial.print("Top: ");
            Serial.println(value);
            topServo.write(value);
        }
        break;

    case 'b':
    case 'B':
        {
            int index;
            const int value = get_int(buffer+1, BUF_SIZE-1, index); 
            Serial.print("Bottom: ");
            Serial.println(value);
            botServo.write(value);
        }
        break;

    case 's':
    case 'S':
        Serial.print("Switch is ");
        Serial.println(digitalRead(switchPin) ? "ON" : "OFF");
        break;

    case 'u':
    case 'U':
        i = 0;
        while (!Serial.available())
        {
            Serial.print("Distance (");
            Serial.print(i++);
            Serial.print(") ");
            Serial.println(getDistance());
            delay(1);
        }
        break;
        
    case 'a':
    case 'A':
        i = 0;
        while (!Serial.available())
        {
            Serial.print("SDistance (");
            Serial.print(i++);
            Serial.print(") ");
            Serial.println(getSmoothedDistance());
            delay(1);
        }
        break;
        
    case 'q':
    case 'Q':
        Serial.println("Quit");
        return true;
        
    default:
        Serial.println("ERROR: Unknown command");
        break;
    }
    return false;
}

void console()
{
    while (1)
    {
        Serial.print("> ");
        while (1)
        {
            if (Serial.available())
            {
                char c = Serial.read();
                if ((c == '\r') || (c == '\n'))
                {
                    buffer[index] = 0;
                    index = 0;
                    if (process(buffer))
                        return;
                    break;
                }
                else
                {
                    if (index >= BUF_SIZE)
                    {
                        Serial.println("Error: Line too long");
                        index = 0;
                        continue;
                    }
                    buffer[index++] = c;
                }
            }
            else
            {
                delay(10);
            }
        }
    }
}
