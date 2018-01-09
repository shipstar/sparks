// Taken from: http://www.arduino.cc/playground/Learning/SerialLCD

void setup()
{
  Serial.begin(2400);
}

void loop()
{ 
  sayHiToAlex();
}

void sayHiToAlex()
{
  backlightOn();  // turn the backlight on all the time
  
  clearLCD();
  Serial.print("Hello");  // print text to the current cursor position
  newLine();              // start a new line
  Serial.print("Alexuino");
  delay(5000);
  backlightOff();
  delay(2000);
}

void playOdeToJoy()
{
  play(227, true);
  play(227, true);
  play(228, true);
  play(230, true);
  play(230, true);
  play(228, true);
  play(227, true);
  play(225, true);
  play(223, true);
  play(223, true);
  play(225, true);
  play(227, true);
  play(227, true);
  play(225, true);
  play(225, true);
}

void play(int value, boolean doPause)
{
    Serial.print(value, BYTE);
    if (doPause){
      pause();
    }
}

void pause()
{
  delay(500);
}

void clearLCD(){
  Serial.print(12, BYTE);
  delay(5); // Toumey says we need to wait 5ms based on some documentation he found.
}

void newLine() { 
  Serial.print(10, BYTE); 
}

// turn on backlight
void backlightOn(){
  Serial.print(17, BYTE);
}

// turn off backlight
void backlightOff(){
  Serial.print(18, BYTE);
}
