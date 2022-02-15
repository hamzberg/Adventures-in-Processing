/*
  Author: Hamz Berg  
*/

//colors - stores color scheme
color blue_Sky = color(140, 221, 255);
color foggy_Bottom = color(217, 244, 255);

//int - establishes starting values for coordinate positions
int x_Position = 330;
int y_Position = -72;

void setup() {
 
  size(720, 720);

  background(blue_Sky);
  noStroke();

}

void draw(){

  frame();
  
  //rect - creates square and then prints it moving downward
  rect(x_Position, y_Position += 72, 64, 64);
  
  //fill - decreases foggy_Bottom color values upon each cycle
  fill(foggy_Bottom -= 15);

  //if - stops printing when y_Position is greater than 720
  if (y_Position >= 720) {
    noLoop();
  }
   
}

void frame() {
  
  
  //Creates the frame
  noStroke(); fill(255);
  
  rect(0,0,25,720);       //Left Side
  rect(0,0,720, 25);      //Top Side
  rect(720,720,-25,-720); //Right Side
  rect(720,720,-720,-50); //Bottom Side
  
  fill(0); textSize(18); textAlign(LEFT);
  
  text("Hamz Berg", 23, 18);
  text("Processing Sketch #6", 512, 18);
  
  textSize(22); textAlign(CENTER);
  
  text("Simpler Rain", width/2, 695); 
  
  fill(128); textSize(12);
  
  text("\"Very simple, very minimal.\"", width/2, 710);

  fill(blue_Sky);      rect(25, 690, 20, 60);
  fill(217, 244, 255); rect(45, 690, 20, 60);
  fill(foggy_Bottom);  rect(65, 690, 20, 60);
  
}
