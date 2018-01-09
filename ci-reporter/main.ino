int activeLed = -1;
bool debug = false;

void setup() {
  pinMode(D0, OUTPUT);
  pinMode(D1, OUTPUT);
  pinMode(D2, OUTPUT);

  if (debug) { Serial.begin(9600); }
  Particle.subscribe("buildStatus", handleBuildStatus);
}

void loop() {
}

void handleBuildStatus(const char *event, const char *data) {
  int newLed;
  if (strcmp(data, "passed") == 0) {
    newLed = D0;
  } else if (strcmp(data, "pending") == 0) {
    newLed = D1;
  } else {
    newLed = D2;
  }

  if (debug) {
    Serial.print("activeLed: ");
    Serial.println(activeLed);

    Serial.print("newLed: ");
    Serial.println(newLed);
  }

  if (activeLed == -1 || newLed != activeLed) {
    if (debug) { Serial.print("Changing activeLed!"); }
    digitalWrite(activeLed, LOW);
    activeLed = newLed;
    digitalWrite(activeLed, HIGH);
  }
}
