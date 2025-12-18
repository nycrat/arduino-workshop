#set page(width: 1920pt, height: 1080pt, fill: rgb("#fffbfc"))
#set page(footer: context [
  #set text(30pt)
  #h(1fr)
  #counter(page).display("1/1", both: true)
])

/*
#let x = 2.2
#set page(width: 11in * x, height: 8.5in * x, fill: rgb("#fffbfc"))
*/

#set text(40pt, font: "IBM Plex Mono")

#[
  #set align(center + horizon)
  = Ultrasonic Arduino Sensor
  // #text(rgb("#888"))[Basics of Arduino Circuits _Eric, Andy, Allen_ ]
]

#page[
  #align(center + horizon)[What is SONAR ?]
]

#page[
  #align(center + horizon)[*Sound navigation and ranging*]
]

#page[
  #set align(center)
  #image("sonar.png", height: 100%)
]

#page[
  #set align(center)
  #image("bat.png", height: 100%)
]

#page[
  #set align(center)
  #image("ultrasound.png", height: 100%)
]

#[
  #set text(size: 30pt)
  #align(center + horizon)[
    #block(
      stroke: gray,
      fill: rgb("f0f0f0"),
      inset: 20pt,
      radius: 5pt,
      width: 68%,
    )[
      #set align(left)
      ```c
      digitalWrite(trigPin, LOW);
      delayMicroseconds(2);
      digitalWrite(trigPin, HIGH);
      delayMicroseconds(10);
      digitalWrite(trigPin, LOW);
      ```
    ]
  ]
]

#[
  #set text(size: 30pt)
  #align(center + horizon)[
    #block(
      stroke: gray,
      fill: rgb("f0f0f0"),
      inset: 20pt,
      radius: 5pt,
      width: 68%,
    )[
      #set align(left)
      ```c
      int duration = pulseIn(echoPin, HIGH); // microseconds
      double distance = duration * speedOfSound / 2.0;
      ```
    ]
  ]
]
