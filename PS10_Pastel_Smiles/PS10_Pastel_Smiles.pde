/*
  Author: HamzBerg
*/

color[] color_Palette_Pastel = {
  
  color(232, 117, 140),
  color(255, 179, 126),
  color(255, 235, 165),
  color(166, 217, 166),
  color(98, 195, 222)  
  
};

int y_Position = 25;
int x_Position = 10;

void setup(){

  size(720, 720);
  noStroke();
  fill(150); textSize(32); text("Hold A to Start!", 250, 360);
  
}

void draw(){
 
  if(keyPressed && (key == 'S' || key == 's')){ 
  
  save("PastelSmiles_" + hour() + minute() + second()); 

  }
  
  if(keyPressed && (key == 'A' || key == 'a')){ 
    
    background(color_Palette_Pastel[int(random(0,5))]);
    fun_Pattern(); 
    
  }
 
  frame();
  
}

void fun_Pattern(){
 
  //for - creates pattern
  for (int i = 0; i < 13; i++) {
   
    //(nested) for - creates pattern row
    for (int e = 0; e < 13; e++) {
     
      //rect - creates the rectangle base
      fill(color_Palette_Pastel[int(random(0,5))]);
      rect(x_Position, y_Position, 100, 100, 20);
      
      //2D Primitives - creates the smile
      fill(color_Palette_Pastel[int(random(0,5))]);
      circle(x_Position + 10, y_Position + 10, 5);
      circle(x_Position + 20, y_Position + 10, 5);
      arc(x_Position + 15, y_Position + 15, 15, 15, 0, PI); 
      
      //int - increments just after previous rectangle
      x_Position += 55;
      
    }
    
    //int - resets x-axis position
    x_Position = 10;
    //int - increments just after previous rectangle row
    y_Position += 55;
    
  }
  
  //ints - resets x-axis & y-axis positions
  y_Position = 25;
  x_Position = 10;
  


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
  text("Processing Sketch № 10", width - 115, 18);
  text("Level: A", width/2, 18);
  
  //commands - creates bottom content boxes & title text & subtitle text
  fill(225, 216, 188);
  rect(10, height - 100, width - 20, 50, 0, 0, 7, 7);
  rect(10, height - 40, width - 20, 50, 7, 7, 0, 0);
  textSize(22); fill(0);
  text("Pastel Smiles", width/2, height - 75);
  fill(64); textSize(12);
  text("Press or hold \'A\' to generate a new grid pattern. Press \'S\' to save.", width/2, height - 60);
}
