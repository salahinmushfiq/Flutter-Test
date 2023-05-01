// Wire Library for I2C
#include <Wire.h>
 
//Adafruit PCA9685 Servo Library
#include <Adafruit_PWMServoDriver.h>
 
//object to represent PCA9685 at default I2C address
Adafruit_PWMServoDriver pca9685 = Adafruit_PWMServoDriver(0x40);
 
// maximum and minimum number of "ticks" for the servo motors
// Range from 0 to 4095
// This determines the pulse width
 
#define SERVOMIN  80 // Minimum value
#define SERVOMAX  600  // Maximum value
// VCC,V+,VIN to battery + 
// SDA 21,SCL 22 


// // Define servo motor connections (expand as required)
// #define SER0  0   //Servo Motor 0 on connector 0
// #define SER1  1   //Servo Motor 1 on connector 12
// #define SER2  2   //Servo Motor 2 on connector 02
// #define SER3  3   //Servo Motor 3 on connector 03
// #define SER4  4   //Servo Motor 4 on connector 04
// #define SER5  5   //Servo Motor 5 on connector 05
 

#define SER0  0   //Servo Motor 0 on connector 0
#define SER1  1   //Servo Motor 1 on connector 12
#define SER2  2   //Servo Motor 2 on connector 02
#define SER3  3   //Servo Motor 3 on connector 03
#define SER4  4   //Servo Motor 4 on connector 04
#define SER5  5   //Servo Motor 5 on connector 05 
// Variables for Servo Motor positions (expand as required)
int pwm0;
int pwm1;
int pwm2;
int pwm3;
int pwm4;
int pwm5;
 
void setup() {
 
  // Serial monitor setup
  Serial.begin(115200);
 
  // Print to monitor
  Serial.println("PCA9685 Servo Test");
 
  // Initialize PCA9685
  pca9685.begin();
 
  // Set PWM Frequency to 50Hz
  pca9685.setPWMFreq(50);
 
}
void rotateForward(int SER,int pwm){
 // Move Motor 0 from 0 to 180 degrees
  for (int posDegrees = 0; posDegrees <= 90; posDegrees++) {
 
    // Determine PWM pulse width
    pwm = map(posDegrees, 0, 90, SERVOMIN, SERVOMAX);
    // Write to PCA9685
    pca9685.setPWM(SER, 0, pwm);
    // Print to serial monitor
    Serial.print("Motor 0 = ");
    Serial.println(posDegrees);
    delay(30);
  }
}
void rotateBackward(int SER,int pwm){
  // Move Motor 0 from 180 to 0 degrees
  for (int posDegrees = 90; posDegrees >= 0; posDegrees--) {
 
    // Determine PWM pulse width
    pwm = map(posDegrees, 0, 90, SERVOMIN, SERVOMAX);
    // Write to PCA9685
    pca9685.setPWM(SER, 0, pwm);
    // Print to serial monitor
    Serial.print("Motor 0 = ");
    Serial.println(posDegrees);
    delay(30);
  }
}
void loop() {
  rotateForward(SER0,pwm0);
  rotateForward(SER1,pwm1);
  rotateForward(SER2,pwm2);
  rotateForward(SER3,pwm3);
  rotateForward(SER4,pwm4);
  rotateForward(SER5,pwm5);
  rotateBackward(SER0,pwm0);
  rotateBackward(SER1,pwm1);
  rotateBackward(SER2,pwm2);
  rotateBackward(SER3,pwm3);
  rotateBackward(SER4,pwm4);
  rotateBackward(SER5,pwm5);
}
