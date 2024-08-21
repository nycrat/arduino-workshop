#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);

const int BUTTON_PIN = 10;
const int LED_PIN = 2;

long ledStartTime; // stores start time of LED turning on

void setup() {
  // set up pins to proper input/output
  pinMode(BUTTON_PIN, INPUT);
  pinMode(LED_PIN, OUTPUT);

  // set up lcd, and print welcome message
  lcd.init();
  lcd.backlight();
  lcd.print("CLICK TO START!");

  // initialize / reset is the same
  reset();
}

void waitForClick() {
  // wait for button release
  while (true) {
    if (digitalRead(BUTTON_PIN) == LOW) {
      break;
    }
  }
  // wait for button down
  while (true) {
    if (digitalRead(BUTTON_PIN) == HIGH) {
      break;
    }
  }
  // wait for button release
  while (true) {
    if (digitalRead(BUTTON_PIN) == LOW) {
      break;
    }
  }
}

void reset() {
  waitForClick(); // click to reset

  digitalWrite(LED_PIN, LOW);
  lcd.clear();
  lcd.print("WAIT FOR LIGHT!");

  ledStartTime = millis() + random(1000, 3000);
}

void loop() {
  if (digitalRead(BUTTON_PIN) == HIGH) { // check if clicked early
    lcd.clear();
    lcd.print("TOO EARLY");
    reset();
  }
  if (millis() >= ledStartTime) { // check if time to start
    lcd.clear();
    lcd.print("CLICK!");
    digitalWrite(LED_PIN, HIGH);

    waitForClick();
    int resultTime = millis() - ledStartTime;

    lcd.clear();
    lcd.print(resultTime);
    lcd.print("ms");
    reset();
  }
}
