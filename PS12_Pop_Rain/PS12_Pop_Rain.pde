/*
  Author: HamzBerg    
*/

int x_Position = 0;
int y_Position = 0;

color[] color_Palette_Arcadia = {
  
 color(242, 39, 171),
 color(108, 48, 191),
 color(23, 20, 115),
 color(27, 181, 242),
 color(242, 208, 39)
 
};

void setup() {

  size(720, 720);  
  noStroke();
  background(255);
  
}

void draw() {

  blendMode(MULTIPLY);
  
  //for - creates the rain pattern
  for (int i = 0; i < 250; i++){
    
    //if - breaks the loop if the y_Position is above height
    if(y_Position >= height){ break; }    
   
    //circles - creates a rain droplet and randomizes fill color
    fill(color_Palette_Arcadia[int(random(0, 5))]);
    circle(x_Position, y_Position, 50);
    circle(x_Position, y_Position + 20, 40);
    circle(x_Position, y_Position + 40, 30);
    circle(x_Position, y_Position + 60, 20);
    circle(x_Position, y_Position + 70, 10);
    
    //int - increments x-axis position just after previous rain droplet
    x_Position += 50;
    
    //if - resets x_Position if past width and lowers y_Position for new row
    if(x_Position >= width){
    
      x_Position = 0;
      y_Position += 50;
      
    }
    
  }

 
  //if - saves the pattern to tif image file
  if(keyPressed && (key == 'S' || key == 's')) {
    
    save("PopRain_" + hour() + minute() + second());
    
  }
  
  //if - redraws the pattern
  if(keyPressed && (key == 'r' || key == 'R')) {
    
    blendMode(REPLACE);
    background(255);
    x_Position = 0;
    y_Position = 0;
    
  }
  
  //function - displays the frame on top of pattern
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
  text("Processing Sketch № 12", width - 115, 18);
  text("Level: C", width/2, 18);
  
  //commands - creates bottom content boxes & title text & subtitle text
  fill(225, 216, 188);
  rect(10, height - 100, width - 20, 50, 0, 0, 7, 7);
  rect(10, height - 40, width - 20, 50, 7, 7, 0, 0);
  textSize(22); fill(0);
  text("Pop Rain", width/2, height - 75);
  fill(64); textSize(12);
  text("Press \'S\' to save frame. Press \'R\' to randomize color.", width/2, height - 60);
}
