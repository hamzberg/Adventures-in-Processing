/*
  Author: HamzBerg
*/

int x_Position = 0;
int y_Position = 0;

int size = 20;
int polarity = 10;

color[] color_Palette_Psych = {
 
  color(255, 190, 0),
  color(212, 41, 103),
  color(115, 43, 142),
  color(13, 210, 5),
  color(224, 94, 49)  
  
};

void setup() {
  
   size(720, 720);  
   background(color_Palette_Psych[0]);
}

void draw() {  
  
  noFill();
  strokeWeight(7);
  blendMode(MULTIPLY);

  //for - creates the life savor pattern
  for (int i = 0; i < width; i++) {
    
    //if - breaks for-loop if x_Position goes beyond width
    if( x_Position >= width ) { break; }
    
    //Circle - draws a circle
    stroke(color_Palette_Psych[int(random(0,5))]);
    circle(0 + x_Position, 0 + y_Position, size);
    
    //int - lowers circle draw
    y_Position += 15;
    
    //ints - in/decreases size
    size += polarity;
    
    //if - polarizes polarity based on a 50 max and 10 min
    if (size >= 50 || size <= 10){
       polarity *= -1;
    }     
    
    //if - resets y-axis position if passed height and moves x-axis position over 
    if (y_Position > height){
      
       y_Position = 0;
       x_Position += 65;
       
     }
    
  } 
  
  //if - saves the pattern to tif image file
  if(keyPressed && (key == 'S' || key == 's')) {
    
    save("LifeSavors_" + hour() + minute() + second());
    
  }
  
  //if - redraws the pattern
  if(keyPressed && (key == 'r' || key == 'R')) {
    
    blendMode(REPLACE);
    background(color_Palette_Psych[0]);
    x_Position = 0;
    y_Position = 0;
    
  }
  
  frame();
  
}

void frame() {
  //commands - establishes frame startup settings
  noStroke();
  fill(240, 228, 202);
  blendMode(REPLACE);
  textAlign(CENTER);
  colorMode(RGB, 255);
  rectMode(CORNER);
  
  //rects - creates border
  rect(0, 0, 10, height); //Left Side
  rect(0, 0, width, 25); //Top Side
  rect(width, height, -10, -height); //Right Side
  rect(width, height, -width, -100); //Bottom Side
  fill(0); textSize(18);
  
  //texts - creates top texts
  text("HamzBerg", 55, 18);
  text("Processing Sketch № 13", width - 115, 18);
  text("Level: C", width/2, 18);
  
  //commands - creates bottom content boxes & title text & subtitle text
  fill(225, 216, 188);
  rect(10, height - 100, width - 20, 50, 0, 0, 7, 7);
  rect(10, height - 40, width - 20, 50, 7, 7, 0, 0);
  textSize(22); fill(0);
  text("Life Savors", width/2, height - 75);
  fill(64); textSize(12);
  text("Press \'S\' to save frame. Press \'R\' to randomize color.", width/2, height - 60);
}
