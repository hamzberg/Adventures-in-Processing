/*
  Author: HamzBerg  
*/

int x_Position = 10;
int y_Position = 25;

int switch_Palette = 0;

color[] color_Palette_Deep = {
  
  color(164, 150, 105), 
  color(111, 76, 34),
  color(29, 33, 115), 
  color(44, 54, 115), 
  color(189, 186, 197) 
  
};

color[] color_Palette_Beach = {
  color(2, 56, 89),           
  color(3, 103, 166),
  color(86, 135, 166),  
  color(191, 171, 159),  
  color(191, 143, 115)  
};

color[] color_Palette_Mix = {
  color(216, 209, 191),  
  color(191, 116, 99),
  color(56, 135, 166),     
  color(217, 185, 91),    
  color(74, 74, 72)    
  
};

color[] color_Palette_Selected = new color[5];

void setup() {

  size(720,720);
  pixelDensity(displayDensity());
  frameRate(60);
  fill(150); textSize(32); text("Hold A to Start!", 250, 360);
   
}

void draw() {
  
  if (keyPressed && (key == 'a' || key == 'A')){
    random_Pattern_Maker();
  }
  
  if (keyPressed && (key == 's' || key == 'S')){
     save("TeyeLE_" + hour() + minute() + second());
  }

  frame();
  
}

void random_Pattern_Maker(){
 
  //for - creates each row of tile
  for (int e = 0; e <= 5; e += 1) {
    
    //(nested) for - creates each tile
    for(int i = 0; i <= 6; i += 1) { 
   
        switch_Palette = int(random(1, 4));
        
        //ifs & fors - selects the color palette based on the random generation of switch_Palette  
        if (switch_Palette == 1) {        
          for(int j = 0; j < color_Palette_Selected.length; j++) {            
             color_Palette_Selected[j] = color_Palette_Deep[j];          
          }          
        } else if (switch_Palette == 2) {        
          for(int j = 0; j < color_Palette_Selected.length; j++) {            
             color_Palette_Selected[j] = color_Palette_Beach[j];          
          }          
        } else if (switch_Palette == 3) {        
          for(int j = 0; j < color_Palette_Selected.length; j++) {            
             color_Palette_Selected[j] = color_Palette_Mix[j];          
          }          
        }
      //function - calls to create the tile   
      pretty_Picture();
      //int - moves the x-axis position over just enough to not overlap tile
      x_Position += 100;
    
    }   
    //int - moves a row down
    y_Position += 100;
    //int - resets x-axis position back to frame left
    x_Position = 10;
  
  }  
  //int - resets y-axis position back to top left
  y_Position = 25;
  
}

//function - draws the tile
void pretty_Picture(){

  rectMode(CENTER);
  
  noStroke();
  
  //Creates the base
  fill(color_Palette_Selected[0]);
  square(50 + x_Position, 50 + y_Position, 100);
  
  //Creates the corner arcs
  stroke(color_Palette_Selected[3]);
  noFill();
  int arc_Size = 5;
  for (int i = 0; i < 25; i++) { arc(0 + x_Position, 0 + y_Position, arc_Size += 5, arc_Size, 0, HALF_PI); }
  arc_Size = 5;
  for (int i = 0; i < 25; i++) { arc(100 + x_Position, 0 + y_Position, arc_Size += 5, arc_Size, HALF_PI, PI); }
  arc_Size = 5;
  for (int i = 0; i < 25; i++) { arc(100 + x_Position, 100 + y_Position, arc_Size += 5, arc_Size, PI, PI + HALF_PI); }
  arc_Size = 5;
  for (int i = 0; i < 25; i++) { arc(0 + x_Position, 100 + y_Position, arc_Size += 5, arc_Size, PI + HALF_PI, PI + PI); }
    
  noStroke(); 
  
  //Creates centerpiece stroke
  fill(color_Palette_Selected[1]);  
  circle(50 + x_Position, 50 + y_Position, 75);
  circle(17 + x_Position, 50 + y_Position, 35);
  circle(50 + x_Position, 17 + y_Position, 35);
  circle(50 + x_Position, 83 + y_Position, 35);
  circle(83 + x_Position, 50 + y_Position, 35);  
  
  //Creates centerpiece
  fill(color_Palette_Selected[2]);
  circle(50 + x_Position, 50 + y_Position, 65);
  circle(17 + x_Position, 50 + y_Position, 25);
  circle(50 + x_Position, 17 + y_Position, 25);
  circle(50 + x_Position, 83 + y_Position, 25);
  circle(83 + x_Position, 50 + y_Position, 25);
  
  //Creates the eye of the centerpiece
  fill(color_Palette_Selected[1]);
  ellipse(50 + x_Position, 50 + y_Position, 50, 25);
  fill(color_Palette_Selected[3]);
  circle(50 + x_Position, 50 + y_Position, 20);
  fill(color_Palette_Selected[4]);
  circle(50 + x_Position, 50 + y_Position, 12);
  fill(color_Palette_Selected[3]);
  circle(53 + x_Position, 47 + y_Position, 6);  
  
  //Creates layer one of the corner circles
  fill(color_Palette_Selected[1]);
  circle(15 + x_Position, 85 + y_Position, 15);
  circle(15 + x_Position, 15 + y_Position, 15);
  circle(85 + x_Position, 15 + y_Position, 15);
  circle(85 + x_Position, 85 + y_Position, 15);  
  
  //Creates layer two of the corner circles
  fill(color_Palette_Selected[3]);
  circle(15 + x_Position, 85 + y_Position, 10);
  circle(15 + x_Position, 15 + y_Position, 10);
  circle(85 + x_Position, 15 + y_Position, 10);
  circle(85 + x_Position, 85 + y_Position, 10);
  
  //Creates layer three of the corner circles
  fill(color_Palette_Selected[4]);
  circle(15 + x_Position, 85 + y_Position, 5);
  circle(15 + x_Position, 15 + y_Position, 5);
  circle(85 + x_Position, 15 + y_Position, 5);
  circle(85 + x_Position, 85 + y_Position, 5); 
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
  text("Processing Sketch № 9", width - 110, 18);
  text("Level: A", width/2, 18);
  
  //commands - creates bottom content boxes & title text & subtitle text
  fill(225, 216, 188);
  rect(10, height - 100, width - 20, 50, 0, 0, 7, 7);
  rect(10, height - 40, width - 20, 50, 7, 7, 0, 0);
  textSize(22); fill(0);
  text("T[eye]LE", width/2, height - 75);
  fill(64); textSize(12);
  text("Press or hold \'A\' to generate a new tile pattern. Press \'S\' to save.", width/2, height - 60);
}
