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

const int botAngleMax = 160 - 40;                 // angle in degrees that the bottom arm will fully extend to
const int botAngleMin = 0;        //  angle in degrees that the bottom arm goes to when fully retracted
const int topAngleMax = 158 - 40;                // angle in degrees that the top arm will fully extend to        
const int topAngleMin = 0;               // angle in degrees that the top arm goes to when fully retracted
const int distanceMax = 50;                // the maximum distance away from the sensor that the bottom servo will respond to
const float thresholdPercent = 0.93; // percentage of the maximum travel of the bottom arm where the arm should fully commit to pressing the switch
const float threshCommit = thresholdPercent * (botAngleMax - botAngleMin); // the calculated angle when the arm should fully commit to pressing the switch


void setup() 
{
    Serial.begin(115200);
    Serial.println("Exceptionally Useless Box 115200");

    topServo.attach(11);              
    botServo.attach(10);              
    topServo.write(topAngleMin);        // set initial position of the top arm
    botServo.write(botAngleMin);       // set initial position of the bottom arm
    delay(5000);
    pinMode(switchPin, INPUT_PULLUP); // don't forget to put a pull-up resistor on this pin
    pinMode(echoPin, INPUT);
    pinMode(trigPin, OUTPUT);
    Serial.println("Init done");

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
  digitalWrite(trigPin,LOW);
  float duration = pulseIn(echoPin, HIGH, 250000);
  float measuredDistance = duration*.034/2;
  return measuredDistance;
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
    resetSwitch();
}

void updateBotArm(float handDistance)
{
    // convert the sensor distance range to the output angle range, but inverted so that the angle goes up as the distance goes down
    float motorPosition = map(handDistance, 0, distanceMax, botAngleMax, botAngleMin);
    Serial.print("Dist ");
    Serial.print(handDistance);
    Serial.print(" -> ");
    Serial.println(motorPosition);
    {
        if (handDistance < 7)
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
    float distance = getDistance();
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
