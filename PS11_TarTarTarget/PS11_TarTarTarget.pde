/*
  Author: HamzBerg
*/


int x_Position = -36;
int y_Position = -36;

color random_Color_One = color(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)));
color random_Color_Two = color(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)));

void setup(){
 
  size(720, 720);
  background(int(random(50, 255)), int(random(50, 255)), int(random(50, 255)));
  strokeWeight(3);
  
}

void draw(){
  
  //for - creates the target pattern
  for (int i = 0; i < 422; i++) {
    
    stroke(random_Color_Two);
    
    //Circles - creates the target
    fill(random_Color_One); 
    circle(x_Position + 36, y_Position + 36, 72);
    fill(255);
    circle(x_Position + 36, y_Position + 36, 48);
    fill(random_Color_One);
    circle(x_Position + 36, y_Position + 36, 24);
    
    x_Position += 36;
    
    //(nested) if - prevents x_Position from going beyond width and sets up a new row
    if (x_Position >= width) {
      
      x_Position = 0;
      y_Position += 36;
    
    }
  }
  
  //ints - resets x-axis and y-axis position
  x_Position = -36;
  y_Position = -36;
    
  frame();
    
  if(keyPressed && (key == 'S' || key == 's')) {
    
    saveFrame("TarTarTarget_####_" + hour() + minute() + second());
    
  }
  
  if(keyPressed && (key == 'r' || key == 'R')) {
    
    random_Color_One = color(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)));
    random_Color_Two = color(int(random(1, 255)), int(random(1, 255)), int(random(1, 255)));
    
  }
  
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
  text("Processing Sketch № 11", width - 115, 18);
  text("Level: C", width/2, 18);
  
  //commands - creates bottom content boxes & title text & subtitle text
  fill(225, 216, 188);
  rect(10, height - 100, width - 20, 50, 0, 0, 7, 7);
  rect(10, height - 40, width - 20, 50, 7, 7, 0, 0);
  textSize(22); fill(0);
  text("TarTarTarget", width/2, height - 75);
  fill(64); textSize(12);
  text("Press \'S\' to save frame. Press \'R\' to randomize color.", width/2, height - 60);
}
