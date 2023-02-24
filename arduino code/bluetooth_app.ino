#include <SoftwareSerial.h>
SoftwareSerial HC06(2, 3); //HC06-TX Pin 2, HC06-RX to Arduino Pin 3

#define relay1 4
#define relay2 5
#define relay3 6
#define relay4 7

void setup() {
  HC06.begin(9600); //Baudrate 9600
  pinMode(relay1, OUTPUT);
  pinMode(relay2, OUTPUT);
  pinMode(relay3, OUTPUT);
  pinMode(relay4, OUTPUT);
}

void loop() {

  if(HC06.available() > 0) //When HC06 receive something
  {
    char receive = HC06.read(); //Read from Serial Communication
    if(receive == '1') //If received data is 1, turn on the relay 
    {
      digitalWrite(relay1, HIGH); 
    }
    if(receive == '0') //If received data is 0, turn off the relay 
    {
      digitalWrite(relay1, LOW); 
    }
    if(receive == '2') //If received data is 2, turn on the relay2
    {
      digitalWrite(relay2, HIGH); 
    }
    if(receive == '3') //If received data is 3 turn on the relay3
    {
      digitalWrite(relay3, HIGH); 
    }
    if(receive == '4') //If received data is 4, turn on the relay4 
    {
      digitalWrite(relay4, HIGH); 
    }
    if(receive == '9')//if 9, act like a button and turn off the relay
    {
      digitalWrite(relay4, LOW);
      digitalWrite(relay3, LOW);
      digitalWrite(relay2, LOW);
    }
  }

}
