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
  Serial.begin(9600);

}

void loop() {

  if(HC06.available() > 0) //When HC06 receive something
  {
    char receive = HC06.read(); //Read from Serial Communication
    if(receive == '1') //If received data is I, turn on the relay 
    {
      Serial.print('1');
      digitalWrite(relay1, HIGH); 
      
    }
    if(receive == '0') //If received data is I, turn on the relay 
    {
      Serial.print('0');
      digitalWrite(relay1, LOW); 
      
    }
    if(receive == '2') //If received data is 2, turn on the relay2
    {
      Serial.print("2");
      digitalWrite(relay2, HIGH); 
      delay(1000);
      digitalWrite(relay2, LOW);
    }
    if(receive == '3') //If received data is 3 turn on the relay3
    {
      Serial.print("3");
      digitalWrite(relay3, HIGH); 
      delay(1000);
      digitalWrite(relay3, LOW);
    }
    if(receive == '4') //If received data is 4, turn on the relay4 
    {
      Serial.print("4");
      digitalWrite(relay4, HIGH); 
      delay(1000);
      digitalWrite(relay4, LOW);
    }
  }

}
