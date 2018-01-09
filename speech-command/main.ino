int led = D0;

bool confused = false;
int blinkSpeed = 200;

void setup() {
  pinMode(led, OUTPUT);

  Particle.function("on", ledOn);
  Particle.function("off", ledOff);
  Particle.function("confused", ledBlink);
  Particle.function("changeBlink", changeBlinkSpeed);
}

void loop() {
  if (confused) {
    digitalWrite(led, !digitalRead(led));
    delay(blinkSpeed);
  }
}

int ledOn(String command) {
  confused = false;
  digitalWrite(led, HIGH);
  return 1;
}

int ledOff(String command) {
  confused = false;
  digitalWrite(led, LOW);
  return 1;
}

int ledBlink(String command) {
  confused = true;
  return 1;
}

int changeBlinkSpeed(String command) {
  confused = true;
  blinkSpeed = command.toInt();
}
