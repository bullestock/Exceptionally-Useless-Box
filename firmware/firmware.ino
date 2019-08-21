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

const int switchPin = 5; // pin that the toggle switch is connected to
const int trigPin = 6; // "trig" pin on the ultrasonic sensor
const int echoPin = 7; // "echo" pin on the ultrasonic sensor
Servo topServo; // the "top" servo is the one whose arms extend out of the top lid
Servo botServo; // the "bot" or bottom servo is the one whose arms extend out of the front lid

const int botAngleMax = 168;                 // angle in degrees that the bottom arm will fully extend to
const int botAngleMin = 20;        //  angle in degrees that the bottom arm goes to when fully retracted
const int topAngleMax = 157;                // angle in degrees that the top arm will fully extend to        
const int topAngleMin = 10;               // angle in degrees that the top arm goes to when fully retracted
const int distanceMax = 30;                // the maximum distance away from the sensor that the bottom servo will respond to
const int distanceMin = 7;                // distance at which to press the switch
const float thresholdPercent = 0.93; // percentage of the maximum travel of the bottom arm where the arm should fully commit to pressing the switch
const float threshCommit = thresholdPercent * (botAngleMax - botAngleMin); // the calculated angle when the arm should fully commit to pressing the switch

void console();

void setup() 
{
    Serial.begin(115200);
    Serial.println("Exceptionally Useless Box ready");

    topServo.attach(11);              
    botServo.attach(10);              
    topServo.write(topAngleMin);        // set initial position of the top arm
    botServo.write(botAngleMin);       // set initial position of the bottom arm
    delay(3000);
    pinMode(switchPin, INPUT_PULLUP); // don't forget to put a pull-up resistor on this pin
    pinMode(echoPin, INPUT);
    pinMode(trigPin, OUTPUT);
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

// Returns distance in centimeters
float getDistance()
{ 
  digitalWrite(trigPin, LOW);
  delayMicroseconds(5);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);
  const int TIMEOUT = 26000;
  float duration = pulseIn(echoPin, HIGH, TIMEOUT);
  if (duration == TIMEOUT)
      duration = 0.0;
  if (duration == 0.0)
  {
      pinMode(echoPin, OUTPUT);
      digitalWrite(echoPin, LOW);
      delayMicroseconds(200);
      digitalWrite(echoPin, HIGH);
      delayMicroseconds(200);
      digitalWrite(echoPin, LOW);
      pinMode(echoPin, INPUT);
  }
  float measuredDistance = duration*.034/2;
  return measuredDistance;
}

const int NOF_BINS = 50;
float distances[NOF_BINS];
int cur_bin = 0;
int used_bins = 0;

const float INF_DIST = 1.0e6;

int consecutive_timeouts = 0;
const int MAX_CONSECUTIVE_TIMEOUTS = 2;

float getSmoothedDistance()
{
    const auto d = getDistance();
    Serial.print("d "); Serial.println(d);
    bool is_inf = false;
    if (d < 0.1 || d > 30)
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
        if (getSmoothedDistance() > distanceMin + 5)
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
    if (distance > 1 && distance < distanceMax) // if the reading is close enough to the device, update the motor position
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
