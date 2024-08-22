#set page(width: 1920pt, height: 1080pt, fill: rgb("#fffbfc"))
#set align(center + horizon)
#set page(footer: context [
  #set text(30pt)
  #set align(center)
  #counter(page).display(
    "1/1",
    both: true,
  )
])

#let example(body, size: 30pt) = {
  set text(size)
  block(stroke: gray, fill: rgb("#f0f0f0"), inset: 20pt, radius: 5pt, body)
}

/*
#let x = 2.2
#set page(width: 11in * x, height: 8.5in * x, fill: rgb("#fffbfc"))
*/

#set text(40pt, font: "IBM Plex Mono")

#[
  #set align(center + horizon)
  = Programming Small Little Computers #emoji.computer
  #text(rgb("#888"))[Basics of Arduino Language with _Eric, Andy, Allen_ ]
]

#pagebreak()

= What is Arduino?

#pagebreak()

it's a company that creates microcontrollers and software for them

#pagebreak()

what do arduinos mean to us, for this lesson?

#pagebreak()

microcontrollers that are Arduino uno compatible

#pagebreak()

= What is a microcontroller?

#pagebreak()

small device that has many components of a regular computer,

can execute code, can send input and output signals

#pagebreak()

#columns(3)[
  #image("washer.png")
  #image("microwave.png")
  #image("camera.png")
]

#pagebreak()

what does this mean for arduino programming?

#pagebreak()

we can program logic that takes input, and sends output.

that is it.

#pagebreak()

#image("microwave.png")

#pagebreak()

if (pressed one button) { set time to one minute }

if (pressed two button) { set time to two minutes }

if (pressed start button) { start microwave }

#pagebreak()

if (pressed_button == "1") { time = 1; }

if (pressed_button == "2") { time = 2; }

if (pressed_button == "start") { start("microwave"); }

#pagebreak()

= How do we program an arduino?

#pagebreak()

Arduino Programming Language.

an extended version of C++, for arduino.

#pagebreak()

== How do we program with arduino language?

= And how do we upload the code onto the arduino?

#pagebreak()

#image("arduino_ide.png")

#pagebreak()

#image("arduino_ide_labelled.png")

#pagebreak()

= How do I write Arduino Programming Language?

#pagebreak()

#example[
  ```c
  // The setup() function runs once when you power the Arduino or press reset
  // Lines starting with "//" are comments, only here to explain the code
  void setup() {
    // this runs a function to set the Pin 13 to be for output
    pinMode(13, OUTPUT);
    // this runs a function to send a HIGH voltage (5V) to Pin 13 (turns on LED)
    digitalWrite(13, HIGH);
  }
  
  // The loop() function runs over and over again after setup() is done
  void loop() {
    // nothing is done here just yet
  }
  ```
]

basics

#pagebreak()

#example[
  ```c
  void setup() {
    pinMode(13, OUTPUT);
    digitalWrite(13, HIGH);
  }
  
  // The loop() function runs over and over again after setup() is done
  void loop() {
    // send HIGH voltage to Pin 13 (turns on LED)
    digitalWrite(13, HIGH);
    delay(100); // waits for 100ms
    
    // send LOW voltage to Pin 13 (turns off LED)
    digitalWrite(13, LOW);
    delay(100); // waits for 100ms
  }
  ```
]

loop function

#pagebreak()

#example[
  ```c
  // set variables that are often repeated
  int LED_PIN = 13;
  int DELAY_TIME = 100;
  
  void setup() {
    pinMode(LED_PIN, OUTPUT);
  }
  
  void loop() {
    digitalWrite(LED_PIN, HIGH);
    delay(DELAY_TIME);
    
    digitalWrite(LED_PIN, LOW);
    delay(DELAY_TIME);
  }
  ```
]

variables

#pagebreak()

#example[
  ```c
  int LED_PIN = 13;
  int BUTTON_PIN = 2;
  int DELAY_TIME = 100;
  
  void setup() {
    // set BUTTON_PIN to be for input
    pinMode(BUTTON_PIN, INPUT);
    pinMode(LED_PIN, OUTPUT);
  }
  
  void loop() {
    // stores the voltage of BUTTON_PIN
    int button_voltage = digitalRead(BUTTON_PIN);

    // writes the same voltage to the LED_PIN
    digitalWrite(LED_PIN, button_voltage);
  }
  ```
]

input

#pagebreak()

#example[
  ```c
  int LED_PIN = 13;
  int BUTTON_PIN = 2;
  int DELAY_TIME = 100;
  
  void setup() {
    pinMode(BUTTON_PIN, INPUT);
    pinMode(LED_PIN, OUTPUT);
  }
  
  void loop() {
    // check if BUTTON_PIN is being provided a HIGH voltage
    if (digitalRead(BUTTON_PIN) == HIGH) {
      // if it is being provided HIGH voltage, run this code
      digitalWrite(LED_PIN, HIGH);
      delay(DELAY_TIME);
      
      digitalWrite(LED_PIN, LOW);
      delay(DELAY_TIME);
    }
    // does nothing if our if statement is false
  }
  ```
]

if statements

#pagebreak()

#example[
  ```c
  void setup() {
    // begin communication with computer at a reliable speed
    Serial.begin(9600);
    // prints (displays text) on computer
    Serial.print("Hello World");
  }

  void loop() {
    // prints out milliseconds since the arduino started
    Serial.print(millis());
  }
  ```
]

#pagebreak()

those are the basics.

now you have to piece everything together