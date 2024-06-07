#set page(width: 1920pt, height: 1080pt, fill: rgb("#fffbfc"))

/*
#let x = 2.2
#set page(width: 11in * x, height: 8.5in * x, fill: rgb("#fffbfc"))
*/

#set text(40pt, font: "IBM Plex Mono")

#[
  #set align(center + horizon)
  = Creating a game with Arduino! 
  #text(rgb("#888"))[Basics of Arduino]
]

#pagebreak()

#[
  = Introduction
  ---

  - I'm Eric !
]

#pagebreak()

#[
  = Outline of Workshop
  ---

  - Basic circuits and electrical wiring
  - Integration of Arduino UNO
  - Arduino Programming
  - Wiring Basic Arduino Circuit
  - LCD I2C Interface
  - Programming the Game
  - Wiring the Game Circuit
]

#pagebreak()

#[
  #set page(columns: 2)
  = Electricity
  ---

  - Ohm's Law: $V = I R #sym.arrow.long.double.r I = V/R$
  - Tells us increased resistance = reduced current
  - Too much current = some components overheat
    - LEDs, Arduino, etc.

  #colbreak()

  // #align(center + horizon)[#image("circuit.png", width: 100%)]
  #align(right + horizon)[#image("resistorcircuit.png", width: 95%)]
]

#pagebreak()

#[
  #set page(columns: 2)
  = LEDs
  ---

  - Light-emitting diode
  - Diode lets current go though one direction
  - LED = _"thing that lights up when current goes through in a certain direction"_

  #colbreak()

  #align(center + horizon)[#image("leds.png")]
]

#pagebreak()

#[
  #set page(columns: 2)
  = Circuits and Wiring
  ---

  - Circuit on breadboard, with wires and other components
    - LEDs, Buttons, LCDs, Arduino, resistor, etc.
  - Breadboards make wiring easy to change
    - Great for learning & projects

  #colbreak()

  #align(center + horizon)[#image("breadboard.png", width: 85%)]
]

#pagebreak()

#[
  #set page(columns: 2)
  
  = Arduino
  ---

  - Has pins for output and input
  - Has ground and V5 / V3.3 (constant)
  - Computer connects to upload code
  - Arduino runs with any power source

  #colbreak()

  #align(center + horizon)[#image("arduino.png", width: 90%)]
]

#pagebreak()

#[
  #set page(columns: 2)
  
  = Arduino Code
  ---

  - Uses Arduino language (C++ with special built-in functions)
    - _digitalWrite_(...), _delay_(...), _analogRead_(...), etc.
  - Runs *setup*, then *loop* function
  
  #colbreak()

  #set text(30pt)

  #align(horizon)[
    #text(25pt, rgb("#888"))[Code that turns LED on and off]
    #v(-20pt)
    #block(stroke: gray, fill: rgb("f0f0f0"), inset: 20pt, radius: 5pt)[
      ```c
      const int LED_PIN = 6; // digital 6 pin
      
      void setup() {
        pinMode(LED_PIN, OUTPUT); // set pin to output
      }

      void loop() {
        digitalWrite(LED_PIN, HIGH); // turn on
        delay(1000); // in milliseconds
        
        digitalWrite(LED_PIN, LOW); // turn off
        delay(1000); // in milliseconds
      }
      
    ```
    ]
  ]
]

#pagebreak()

#[
  #set page(columns: 2)
  
  = Buttons
  ---

  - Controls when wires are connected
  - "Pull-Down Resistors" are necessary in Arduino
    - Get rid of excess charge (sends it to ground)

  #colbreak()

  #align(center + horizon)[#image("pulldownresistor.png", width: 118%)]
]

#pagebreak()

#[
  = Code with Button Logic
  ---

  #set text(30pt)
    #align(center + horizon)[
      #block(stroke: gray, fill: rgb("f0f0f0"), inset: 20pt, radius: 5pt, width: 70%)[
        #set align(left)
      ```c
      const int BUTTON_PIN = 10; // digital 10 pin
      const int LED_PIN = 6;
      
      void setup() {
        pinMode(LED_PIN, OUTPUT);
        pinMode(BUTTON_PIN, INPUT); // set pin to input
      }
      
      void loop() {
         //checks if there is high or low input to the pin
        if (digitalRead(BUTTON_PIN) == HIGH) {
           // flash light once
          digitalWrite(LED_PIN, HIGH);
          delay(100);
          digitalWrite(LED_PIN, LOW);
          delay(100);
        }
      }
      
    ```
    ]
  ]  
]

#pagebreak()

#[
  #set page(columns: 2)
  
  = LCD I2C Protocol
  ---

  - Uses two signals
    - SDA used to transmit data
    - SCL used to synchronize data
  - Two other pins are...
    - VCC, just constant voltage
    - GND, just zero voltage

  #colbreak()

  #align(center + horizon)[#image("i2c.png", width: 100%)]
]

#pagebreak()
#pagebreak()
#pagebreak()
