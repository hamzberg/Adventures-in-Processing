/*
  Author: Hamz Berg  
*/

//color - sketch color scheme library
color ink_Magenta = color(242, 5, 203);
color ink_Cyan    = color(5, 242, 219);
color ink_Yellow  = color(242, 226, 5);
color ink_Black   = color(8);
color paper_White = color(242);

//int - manages speed of diameter resize & establishes diameter
int speed = 2;
int diameter = max(50, 10);

void setup(){

  size(720, 720);
  pixelDensity(displayDensity());
  frameRate(60);
  background(paper_White);

}

void draw(){
  
  noStroke();

  frame();

  blendMode(MULTIPLY);
  
  //if - color picker based on mouseX position
  if (mouseX <= 180) {  
    fill(ink_Black);    
  } else if (mouseX <= 360) {    
    fill(ink_Magenta);    
  } else if (mouseX <= 540) {    
    fill(ink_Cyan);    
  } else if (mouseX <= 720) {   
    fill(ink_Yellow);    
  }
  
  //if - creates spray if left mouse button pressed
  if (mouseButton == LEFT && (mouseX >= 50 && mouseX <= 670) && (mouseY >= 50 && mouseY <= 645)) {
    circle(mouseX, mouseY += speed, diameter -= speed);
  } 
  
  //if - clears canvas
  if (mouseButton == RIGHT) {
    blendMode(REPLACE);
    fill(paper_White);
    rect(25, 25, 670, 645);
  } 
  
  //if - resets diameter back to 50 if reaches 0 and below
  if (diameter <= 0 || diameter >= 50) {
    speed *= -1;
  }
  
  //if - prevents strange max() bug where diameter goes above 50 and below 10
  if (diameter > 50) { diameter = 50; }
  if (diameter < 0)  { diameter = 10; }
  
}

void frame() {

  //Creates the frame
  blendMode(REPLACE); noStroke(); fill(255);
  
  rect(0,0,25,720);       //Left Side
  rect(0,0,720, 25);      //Top Side
  rect(720,720,-25,-720); //Right Side
  rect(720,720,-720,-50); //Bottom Side
  
  fill(0); textSize(18); textAlign(LEFT);
  
  text("Hamz Berg", 23, 18);
  text("Processing Sketch #7", 512, 18);
  
  textSize(22); textAlign(CENTER);
  
  text("Broken Printer", width/2, 695); 
  
  fill(128); textSize(12);
  
  text("Left click and hold to paint with ink. Right click to clear canvas.", width/2, 710);

  fill(ink_Magenta); rect(25, 690, 20, 60);
  fill(ink_Cyan);    rect(45, 690, 20, 60);
  fill(ink_Yellow);  rect(65, 690, 20, 60);
  fill(ink_Black);   rect(85, 690, 20, 60);
  fill(paper_White); rect(105, 690, 20, 60);
   
}
