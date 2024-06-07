#include <LiquidCrystal_I2C.h>

LiquidCrystal_I2C lcd(0x27, 16, 2);

const int BUTTON_PIN_1 = 10;
const int BUTTON_PIN_2 = 12;

const int LED_PIN_1 = 2;
const int LED_PIN_2 = 4;

long clickStartTime = -1;
long timerStartTime = 0;
long delayTime = random(1000, 3000);
bool buttonPressed = false;

int targetLed = -1;

void setup() {
  randomSeed(analogRead(0));

  lcd.init();
  lcd.backlight();
  lcd.setCursor(0,0);
  lcd.print("WAIT FOR LIGHT!");

  pinMode(BUTTON_PIN_1, INPUT);
  pinMode(BUTTON_PIN_2, INPUT);
  pinMode(LED_PIN_1, OUTPUT);
  pinMode(LED_PIN_2, OUTPUT);
  timerStartTime = millis();
}

int getPressedButton() {
  while (true) {
    if (buttonPressed) {
      if (digitalRead(BUTTON_PIN_1) == LOW && digitalRead(BUTTON_PIN_2) == LOW) {
        buttonPressed = false;
      }
      continue;
    }

    if (digitalRead(BUTTON_PIN_1) == HIGH) {
      buttonPressed = true;
      return 1;
    }
    if (digitalRead(BUTTON_PIN_2) == HIGH) {
      buttonPressed = true;
      return 2;
    }
  }
  return -1; // shouldn't be possible
}

void waitForButtonInput() {
  int pressedButton = getPressedButton();

  if (pressedButton == targetLed) {
    lcd.clear();
    lcd.print("YOUR TIME: ");
    lcd.setCursor(0, 1);

    lcd.print(millis() - clickStartTime);
    lcd.print("ms");
  } else {
    lcd.clear();
    lcd.print("Wrong Button");
    lcd.setCursor(0, 1);
    lcd.print("Pressed ...");
  }
}

void waitForButtonClick() {
  // wait for release
  while (true) {
    delay(10);
    if (digitalRead(BUTTON_PIN_1) == LOW && digitalRead(BUTTON_PIN_2) == LOW) {
      break;
    }
  }
  // wait for press
  while (true) {
    delay(10);
    if (digitalRead(BUTTON_PIN_1) == HIGH || digitalRead(BUTTON_PIN_2) == HIGH) {
      break;
    }
  }
  buttonPressed = true;
}

void reset() {
  delay(300);
  waitForButtonClick();

  digitalWrite(LED_PIN_1, LOW);
  digitalWrite(LED_PIN_2, LOW);

  lcd.clear();
  lcd.print("WAIT FOR LIGHT!");

  clickStartTime = -1;
  delayTime = random(1000, 3000);
  timerStartTime = millis();
}

void loop() {
  if (millis() >= timerStartTime + delayTime && clickStartTime < 0) {
    lcd.setCursor(0, 0);
    lcd.print("CLICK!          ");
    clickStartTime = millis();

    targetLed = random(2) + 1; // 1 or 2

    if (targetLed == 1) {
      digitalWrite(LED_PIN_1, HIGH);
    } else {
      digitalWrite(LED_PIN_2, HIGH);
    }

    waitForButtonInput();

    digitalWrite(LED_PIN_1, LOW);
    digitalWrite(LED_PIN_2, LOW);

    reset();
  }

  if (digitalRead(BUTTON_PIN_1) == LOW && digitalRead(BUTTON_PIN_2) == LOW) {
    buttonPressed = false;
  }

  if ((digitalRead(BUTTON_PIN_1) == HIGH || digitalRead(BUTTON_PIN_2) == HIGH) && !buttonPressed) {
    lcd.clear();
    lcd.setCursor(0, 1);
    lcd.print("TOO EARLY       ");

    reset();
  }
}
