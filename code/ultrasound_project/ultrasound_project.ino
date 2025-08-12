const int trigPin = 9;
const int echoPin = 10;

const double speedOfSound = 343.0 * 100.0 / 1000000.0; // in cm per microsecond

void setup() {
  pinMode(3, OUTPUT);
  pinMode(5, OUTPUT);
  
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);

  Serial.begin(9600);
}

void flashLights() {
  analogWrite(3, 10);
  analogWrite(5, 0);
  delay(50);
  analogWrite(3, 0);
  analogWrite(5, 10);
  delay(50);

  analogWrite(3, 0);
  analogWrite(5, 0);
}

void loop() {
  // FIGURE OUT HOW THIS WORKS
  digitalWrite(trigPin, LOW);
  delayMicroseconds(2);
  digitalWrite(trigPin, HIGH);
  delayMicroseconds(10);
  digitalWrite(trigPin, LOW);

  int durationMicroseconds = pulseIn(echoPin, HIGH); // microseconds
  double distanceCentimeters = durationMicroseconds * speedOfSound / 2.0;

  Serial.print("Duration: ");
  Serial.println(durationMicroseconds);

  Serial.println();

  Serial.print("Distance: ");
  Serial.println(distanceCentimeters);

  if (distanceCentimeters > 0 && distanceCentimeters < 20) {
    flashLights();
  } else {
    delay(100);
  }
}
