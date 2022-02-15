/*
  Author: Hamz Berg
*/

//int variables - establishes positions for shapes
int x_Position = 360;
int y_Position = 360;
int speed = 5;

int diameter = 100;

//color variables - stores the sketch color scheme 
color lipstick_Magenta = color(219, 49, 91);
color dark_Teal        = color(4, 113, 117);
color midnight_Swamp   = color(2, 35, 32);
color hopeful_Lantern  = color(242, 222, 157);
color fruity_Orange    = color(241, 96, 81);

//setup() - establishes settings
void setup() { 
  size(720, 720); 
  frameRate(60);
}

//draw() - succesive frame animation 
void draw() {

  //Background & basic setups
  background(fruity_Orange);
  landscape();
  noStroke();
  fill(lipstick_Magenta += speed/4);
  
  //Creates manipulated ellipse
  ellipse(x_Position, y_Position += speed, diameter, diameter);
  
  //if - ensures ellipse stays in window
  if ( y_Position >= 600 || y_Position <= 75) { 
    speed *= -1; 
  }
  
  frame();
}

//landscape() - creates the background
void landscape() {

  noStroke();
  fill(dark_Teal);
  ellipse(360, 540, 1000, 1000);
  
  fill(midnight_Swamp);
  stroke(dark_Teal);
  strokeWeight(5);
  
  //Creates right snowman
  ellipse(65, 650, 275, 275);
  ellipse(65, 450, 225, 225);
  ellipse(65, 300, 175, 175);
  
  //Creates left snowman
  ellipse(650, 650, 275, 275);
  ellipse(650, 450, 225, 225);
  ellipse(650, 300, 175, 175);
  
  //Creates middle snowman
  ellipse(360, 650, 275, 275);
  ellipse(360, 450, 225, 225);
  ellipse(360, 300, 175, 175);
  rect(0, 640, 720, 80);
  
}

//frame() - creates the frame
void frame() {
  
  //Creates the frame
  noStroke(); fill(255);
  
  rect(0,0,25,720);       //Left Side
  rect(0,0,720, 25);      //Top Side
  rect(720,720,-25,-720); //Right Side
  rect(720,720,-720,-50); //Bottom Side
  
  fill(0); textSize(18);
  
  text("Hamz Berg", 23, 18);
  text("Processing Sketch #4", 512, 18);
  textSize(22);
  text("Land of the Bouncing Sun", 205, 695); 
  fill(128);
  textSize(12);
  text("\"What goes down, must come up.\"", 250, 710);

  fill(lipstick_Magenta); rect(25, 690, 20, 60);
  fill(dark_Teal);        rect(45, 690, 20, 60);
  fill(midnight_Swamp);   rect(65, 690, 20, 60);
  fill(hopeful_Lantern);  rect(85, 690, 20, 60);
  fill(fruity_Orange);    rect(105, 690, 20, 60);
  
}
