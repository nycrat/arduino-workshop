#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);

const int BUTTON_PIN_1 = 10;
const int BUTTON_PIN_2 = 12;
const int LED_PIN_1 = 2;
const int LED_PIN_2 = 4;

int targetButton;
long ledStartTime;

void setup() {
  pinMode(BUTTON_PIN_1, INPUT);
  pinMode(BUTTON_PIN_2, INPUT);
  pinMode(LED_PIN_1, OUTPUT);
  pinMode(LED_PIN_2, OUTPUT);

  lcd.init();
  lcd.backlight();
  lcd.print("Press any button");
  lcd.setCursor(0,1);
  lcd.print("to start..");
  reset();
}

int waitForClick() {
  int pressedButton;
  while (true) {
    if (digitalRead(BUTTON_PIN_1) == LOW && digitalRead(BUTTON_PIN_2) == LOW) {
      break;
    }
  }
  while (true) {
    if (digitalRead(BUTTON_PIN_1) == HIGH) {
      pressedButton = 1;
      break;
    }
    if (digitalRead(BUTTON_PIN_2) == HIGH) {
      pressedButton = 2;
      break;
    }
  }
  while (true) {
    if (digitalRead(BUTTON_PIN_1) == LOW && digitalRead(BUTTON_PIN_2) == LOW) {
      break;
    }
  }
  return pressedButton;
}

int getClickTime() {
  int pressedButton = waitForClick();
  if (pressedButton == targetButton) {
    return millis() - ledStartTime;
  } else {
    return -1;
  }
}

void reset() {
  waitForClick();

  digitalWrite(LED_PIN_1, LOW);
  digitalWrite(LED_PIN_2, LOW);
  lcd.clear();
  lcd.print("WAIT FOR LIGHT!");

  ledStartTime = millis() + random(1000, 3000);
}

void loop() {
  if (digitalRead(BUTTON_PIN_1) == HIGH || digitalRead(BUTTON_PIN_2) == HIGH) {
    lcd.clear();
    lcd.setCursor(0, 1);
    lcd.print("TOO EARLY");
    reset();
  }
  if (millis() >= ledStartTime) {
    lcd.clear();
    lcd.print("CLICK!");
    targetButton = random(2) + 1; // (0 or 1) + 1 = 1 or 2
    if (targetButton == 1) {
      digitalWrite(LED_PIN_1, HIGH);
    } else {
      digitalWrite(LED_PIN_2, HIGH);
    }

    int resultTime = getClickTime();

    lcd.clear();
    if (result == -1) {
      lcd.print("WRONG BUTTON");
    } else {
      lcd.print("YOUR TIME: ");
      lcd.setCursor(0, 1);
      lcd.print(resultTime);
      lcd.print("ms");
    }

    reset();
  }
}
