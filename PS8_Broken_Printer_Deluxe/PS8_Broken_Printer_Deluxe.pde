/*
  Author: Hamz Berg  
*/

//color - sketch color scheme library
color ink_Magenta = color(242, 5, 203);
color ink_Cyan    = color(5, 242, 219);
color ink_Yellow  = color(242, 226, 5);
color ink_Black   = color(8);
color paper_White = color(242);

//variables - saves choice selections
color selected_Color;
int selected_blendMode;
String text_Display = "Black Pen";

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
  
  //frame() - Creates the frame
  frame();  
  
  //controls() - Creates mouse controls
  controls();
  
  blendMode(selected_blendMode);  
  fill(selected_Color);
  
  //if - creates spray if left mouse button pressed
  if (mouseButton == LEFT && (mouseX >= 35 && mouseX <= 685) && (mouseY >= 50 && mouseY <= 595)) {
    circle(mouseX, mouseY += speed, diameter -= speed);
  }   
  
  //if - polarizes spray size
  if (diameter <= 0 || diameter >= 50) {
    speed *= -1;
  }
  
  //ifs - prevents strange max() bug where diameter goes above 50 and below 10
  if (diameter > 50) { 
    diameter = 50; 
  }
  if (diameter < 0)  { 
    diameter = 10; 
  }
  
  //if - clears canvas
  if (mouseButton == RIGHT) {
    blendMode(REPLACE);
    fill(paper_White);
    rect(10, 25, 700, 595);
  }
  
}

void controls() {
  
  blendMode(REPLACE);
  
  //text - displays tool selected on bottom left
  textSize(18);
  fill(255); rect(15, 685, 250, 30, 5);
  fill(0); text("Tool Selected: ", 85, 707);
  text(text_Display, 205, 707);
  
  //rects - displays buttons on the bottom right
  textSize(14);
  fill(255);
  fill(128);  rect(500, 685, 30, 30, 5); fill(0);   text("S!", 515, 705); //Save Image button
  fill(ink_Magenta); rect(535, 685, 30, 30, 5); fill(0);   text("M", 550, 705);  //Magenta Pen button
  fill(ink_Cyan);    rect(570, 685, 30, 30, 5); fill(0);   text("C", 585, 705);  //Cyan Pen button
  fill(ink_Yellow);  rect(605, 685, 30, 30, 5); fill(0);   text("Y", 620, 705);  //Yellow Pen button
  fill(ink_Black);   rect(640, 685, 30, 30, 5); fill(255); text("B", 655, 705);  //Black Pen button
  fill(200);         rect(675, 685, 30, 30, 5); fill(0);   text("E!", 690, 705); //Eraser button
  noStroke();
  
  //if - creates functionality for the bottom right buttons
  if (mouseButton == LEFT && (mouseX >= 500 && mouseX <= 530) && (mouseY >= 685 && mouseY <= 715)) {    
    //Save Image button
    saveFrame("BPD_####.png");
    text_Display = "Image Saved!";
    fill(255);
    rect(500, 685, 30, 30, 5);    
  } else if (mouseButton == LEFT && (mouseX >= 535 && mouseX <= 565) && (mouseY >= 685 && mouseY <= 715)) {
    //Magenta Pen button
    selected_Color = ink_Magenta;
    selected_blendMode = MULTIPLY;
    text_Display = "Magenta Pen";
    fill(255);
    rect(535, 685, 30, 30, 5);    
  } else if (mouseButton == LEFT && (mouseX >= 570 && mouseX <= 600) && (mouseY >= 685 && mouseY <= 715)) {
    //Cyan Pen button
    selected_Color = ink_Cyan;
    selected_blendMode = MULTIPLY;
    text_Display = "Cyan Pen";
    fill(255);
    rect(570, 685, 30, 30, 5);    
  } else if (mouseButton == LEFT && (mouseX >= 605 && mouseX <= 635) && (mouseY >= 685 && mouseY <= 715)) {
    //Yellow Pen button
    selected_Color = ink_Yellow;
    selected_blendMode = MULTIPLY;
    text_Display = "Yellow Pen";
    fill(255);
    rect(605, 685, 30, 30, 5);    
  } else if (mouseButton == LEFT && (mouseX >= 640 && mouseX <= 670) && (mouseY >= 685 && mouseY <= 715)) {
    //Black Pen button
    selected_Color = ink_Black;
    selected_blendMode = MULTIPLY;
    text_Display = "Black Pen";
    fill(255);
    rect(640, 685, 30, 30, 5);
  } else if (mouseButton == LEFT && (mouseX >= 675 && mouseX <= 705) && (mouseY >= 685 && mouseY <= 715)) {
    //Eraser button
    selected_Color = paper_White;
    selected_blendMode = REPLACE;
    text_Display = "Eraser";
    fill(255);
    rect(675, 685, 30, 30, 5);  
  }  
  
}

void frame() {  
  
  //commands - establishes frame startup settings
  noStroke(); 
  fill(240, 228, 202);
  blendMode(REPLACE);
  textAlign(CENTER);
  colorMode(RGB, 255);
  
  //rects - creates border
  rect(0, 0, 10, height);            //Left Side
  rect(0, 0, width, 25);             //Top Side
  rect(width, height, -10, -height); //Right Side
  rect(width, height, -width, -100); //Bottom Side
  
  fill(0); textSize(18);
  
  //texts - creates top texts
  text("Hamz Berg", width - (width - 55), 18);  
  text("Processing Sketch № 8", width - 110, 18);
  text("Level: A++", width/2, 18);
  
  //commands - creates bottom content boxes & title text & subtitle text
  fill(225, 216, 188);
  rect(10, height - 100, width - 20, 50, 0, 0, 7, 7); 
  rect(10, height - 40, width - 20, 50, 7, 7, 0, 0);
  textSize(22); fill(0);  
  text("Broken Printer Deluxe", width/2, height - 75);  
  fill(64); textSize(12);  
  text("Select Color and Tools at the bottom right, then left click and hold to draw. Right click to clear canvas.", width/2, height - 60);  
   
}
