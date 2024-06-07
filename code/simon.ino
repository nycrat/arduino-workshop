const int SHOW_SEQUENCE_DELAY = 300; // milliseconds

int LED_PINS[4] = {6, 9, 10, 11};
int INPUT_PINS[4] = {2, 3, 4, 5};

int actual_sequence[200];
int actual_length = 0;

int pressed_down_input = -1;

void setup() {
  Serial.begin(9600);
  randomSeed(analogRead(0));

  for (int i = 0; i < 4; i++) {
    pinMode(INPUT_PINS[i], INPUT);
    pinMode(LED_PINS[i], OUTPUT);
  }
  
  reset_game();

  add_to_sequence();
}

void reset_game() {
  actual_length = 0;
  for (int j = 0; j < 3; j++) {
    for (int i = 0; i < 4; i++) {
      analogWrite(LED_PINS[i], 2);
    }
    delay(120);
    for (int i = 0; i < 4; i++) {
      digitalWrite(LED_PINS[i], LOW);
    }
    delay(120);
  }
}

int get_input() {
  while (true) {
    if (digitalRead(INPUT_PINS[pressed_down_input]) == LOW) {
      pressed_down_input = -1;
    }
    for (int i = 0; i < 4; i++) {
      if (digitalRead(INPUT_PINS[i]) == HIGH && pressed_down_input != i) {
        pressed_down_input = i;
        return i;
      }
    }
  }
  return -1;
}

void output_sequence() {
  for (int i = 0; i < actual_length; i++) {
    int pin = LED_PINS[actual_sequence[i]];
    analogWrite(pin, 2);
    delay(SHOW_SEQUENCE_DELAY);
    digitalWrite(pin, LOW);
    delay(SHOW_SEQUENCE_DELAY);
  }
}

void add_to_sequence() {
  actual_sequence[actual_length] = random(4);
  actual_length++;
}

void input_guess_sequence() {
  for (int i = 0; i < actual_length; i++) {
    int guess = get_input();
    analogWrite(LED_PINS[guess], 2);
    delay(100);
    digitalWrite(LED_PINS[guess], LOW);
    if (guess != actual_sequence[i]) {
      reset_game();
      break;
    }
    delay(100);
  }

}

void loop() {
  output_sequence();
  input_guess_sequence();
  add_to_sequence();

  for (int i = 0; i < 4; i++) {
    analogWrite(LED_PINS[i], 2);
  }
  delay(200);
  for (int i = 0; i < 4; i++) {
    digitalWrite(LED_PINS[i], LOW);
  }
  delay(800);
}
