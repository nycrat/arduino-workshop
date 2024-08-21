#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);

const int BUTTON_PIN_1 = 10;
const int BUTTON_PIN_2 = 12;
const int LED_PIN = 2;

long ledStartTime; // stores start time of LED turning on

void setup() {
  // set up pins to proper input/output
  pinMode(BUTTON_PIN_1, INPUT);
  pinMode(BUTTON_PIN_2, INPUT);
  pinMode(LED_PIN, OUTPUT);

  // set up lcd, and print welcome message
  lcd.init();
  lcd.backlight();
  lcd.print("CLICK TO START!");

  // initialize / reset is the same
  reset();
}

int waitForClick() {
  int p1 = 0;
  int p2 = 0;
  while (true) {
    if (p1 == 0 && digitalRead(BUTTON_PIN_1) == LOW) {
      p1++;
    }
    if (p1 == 1 && digitalRead(BUTTON_PIN_1) == HIGH) {
      p1++;
    }
    if (p1 == 2 && digitalRead(BUTTON_PIN_1) == LOW) {
      return 1;
    }

    if (p2 == 0 && digitalRead(BUTTON_PIN_2) == LOW) {
      p2++;
    }
    if (p2 == 1 && digitalRead(BUTTON_PIN_2) == HIGH) {
      p2++;
    }
    if (p2 == 2 && digitalRead(BUTTON_PIN_2) == LOW) {
      return 2;
    }
  }
  // shouldn't be possible
  return -1;
}

void reset() {
  waitForClick(); // click to reset

  digitalWrite(LED_PIN, LOW);
  lcd.clear();
  lcd.print("WAIT FOR LIGHT!");

  ledStartTime = millis() + random(1000, 3000);
}

void checkEarlyClick() {
  if (digitalRead(BUTTON_PIN_1) == HIGH) { // check if clicked early
    lcd.clear();
    lcd.print("TOO EARLY");
    lcd.setCursor(0, 1);
    lcd.print("Player 2 wins");
    reset();
  }
  if (digitalRead(BUTTON_PIN_2) == HIGH) { // check if clicked early
    lcd.clear();
    lcd.print("TOO EARLY");
    lcd.setCursor(0, 1);
    lcd.print("Player 1 wins");
    reset();
  }
}

void loop() {
  checkEarlyClick();
  if (millis() >= ledStartTime) { // check if time to start
    lcd.clear();
    lcd.print("CLICK!");
    digitalWrite(LED_PIN, HIGH);

    int winningPlayer = waitForClick();
    int resultTime = millis() - ledStartTime;

    lcd.clear();
    lcd.print(resultTime);
    lcd.print("ms");
    lcd.setCursor(0, 1);
    lcd.print("Player ");
    lcd.print(winningPlayer);
    lcd.print(" wins");

    reset();
  }
}
