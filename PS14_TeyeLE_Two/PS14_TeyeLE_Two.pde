/*
  HamzBerg  
*/

import processing.pdf.*;

int x_Position = 10;
int y_Position = 25;

int switch_Palette = 0;

boolean pdf_Save = false;

boolean moroccan_Palette_Mode = false;
boolean random_Color_Palette_Mode = false;
boolean random_Value_Palette_Mode = false;

boolean random_Color_Mode = false;
boolean random_Value_Mode = false;

boolean random_Red_Value_Mode = false;
boolean random_Blue_Value_Mode = false;
boolean random_Green_Value_Mode = false;

boolean mono_Invert_Mode = false;
boolean mono_Mode = false;

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

color[] color_Palette_Mono = {
  color(0),  
  color(255),
  color(0),     
  color(255),    
  color(0)  
};

color[] color_Palette_Mono_Invert = {
  color(255),  
  color(0),
  color(255),     
  color(0),    
  color(255)  
};

color[] color_Palette_Random_1 = new color[5];
color[] color_Palette_Random_2 = new color[5];
color[] color_Palette_Random_3 = new color[5];

color[] color_Palette_Random_Mono_1 = new color[5];
color[] color_Palette_Random_Mono_2 = new color[5];
color[] color_Palette_Random_Mono_3 = new color[5];

color[] color_Palette_Selected = new color[5];

void setup() {

  //for - fills color_Palette_Random_# & color_Palette_Random_Mono_# upon start-up.
  for(int j = 0; j < color_Palette_Selected.length; j++) {            
     color_Palette_Random_1[j] = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
     color_Palette_Random_2[j] = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
     color_Palette_Random_3[j] = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
     
     color_Palette_Random_Mono_1[j] = color(int(random(0, 255)));
     color_Palette_Random_Mono_2[j] = color(int(random(0, 255)));
     color_Palette_Random_Mono_3[j] = color(int(random(0, 255)));
  }

  size(720,720);
  //note - this conflicts with the Processing PDF library: pixelDensity(displayDensity());
  frameRate(60);
  textAlign(CENTER);
  fill(150); textSize(32); text("Hold Any Number to Start!", width/2, height/2);
  
}

void draw() {   

  //if - sets up recording procedure for saving to PDF
  if (pdf_Save) { beginRecord(PDF, "TeyeLE_" + hour() + minute() + second() + ".pdf"); }    
  
  //if - starts recording pattern to PDF
  if (keyPressed && (key == 'p' || key == 'P')){     
     pdf_Save = true;     
  } else { pdf_Save = false; }
    
  //if - saves pattern to TIF
  if (keyPressed && (key == 's' || key == 'S')){
     save("TeyeLE_" + hour() + minute() + second());
  }
  
  /*
    The buttons for this sketch use a complicated formula in order to stay functional
    even if the window is resized. This is accomplished with the usage of the width
    and height variables. For the explanation below, variables a, b, c, d, represent 
    any integer. 
    
    Formula for mouseX: 'width/2 - ((width/10 * a) +/- b) +/- width/20'
    
    [width/2]                    -> starts the x-axis position at the center of the window
    [+/- (width/10) * a) +/- b)] -> establishes width and position of the boundary
    [+/- width/20]               -> calculates the minimum or maximum of the boundary
    
    Formula for mouseY: '(height - c) +/- d'
    
    [height - c]                 -> starts the y-axis position near the bottom of the window
    [+/- d]                      -> calculates the minimum or maximum of the boundary
    
    This makes for one picky if statement.
   */    
  
  //if - based on key '1' or in-boundary mouse click, generates a pattern with the Moroccan color palettes
  if ((keyPressed && 
      (key == '1')) ||
     (mousePressed &&
      (mouseX >= ((width/2 - ((width/10 * 4) + 20) - width/20)) && 
      (mouseX <= ((width/2 - ((width/10 * 4) + 20) + width/20))) &&
      (mouseY >= ((height - 20)) - 15) && 
      (mouseY <= ((height - 20) + 15))))) {   
        moroccan_Palette_Mode = true;
        pattern_Maker();
        endRecord();    
  } else { moroccan_Palette_Mode = false; }
  
  //if - based on key '2' or in-boundary mouse click, generates a pattern with 3 random color palettes
  if ((keyPressed && 
      (key == '2')) ||
     (mousePressed &&
      (mouseX >= ((width/2 - ((width/10 * 3) + 15) - width/20)) && 
      (mouseX <= ((width/2 - ((width/10 * 3) + 15) + width/20))) &&
      (mouseY >= ((height - 28)) - 6.5) && 
      (mouseY <= ((height - 28) + 6.5))))) {
        random_Color_Palette_Mode = true;
        pattern_Maker();
        endRecord();    
  } else { random_Color_Palette_Mode = false; }  
  
  //if & for - based on key 'o'/'O' or in-boundary mouse click, generates new random palettes
  if ((keyPressed && 
      (key == 'o' || key == 'O')) ||
     (mousePressed &&
      (mouseX >= ((width/2 - ((width/10 * 3) + 15) - width/20)) && 
      (mouseX <= ((width/2 - ((width/10 * 3) + 15) + width/20))) &&
      (mouseY >= ((height - 12)) - 6.5) && 
      (mouseY <= ((height - 12) + 6.5))))) {
    for(int j = 0; j < color_Palette_Selected.length; j++) {            
       color_Palette_Random_1[j] = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
       color_Palette_Random_2[j] = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
       color_Palette_Random_3[j] = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
    }    
  }
  
  //if - based on key '3' or in-boundary mouse click, generates a pattern with 3 random mono palettes
  if ((keyPressed && 
      (key == '3')) ||
     (mousePressed &&
      (mouseX >= ((width/2 - ((width/10 * 2) + 10) - width/20)) && 
      (mouseX <= ((width/2 - ((width/10 * 2) + 10) + width/20))) &&
      (mouseY >= ((height - 28)) - 6.5) && 
      (mouseY <= ((height - 28) + 6.5))))) {
        random_Value_Palette_Mode = true;
        pattern_Maker();
        endRecord();    
  } else { random_Value_Palette_Mode = false; }
  
  //if & for - based on key 'i'/'I' or in-boundary mouse click, generates new monochrome random palettes
  if ((keyPressed && 
      (key == 'i' || key == 'I')) ||
     (mousePressed &&
      (mouseX >= ((width/2 - ((width/10 * 2) + 15) - width/20)) && 
      (mouseX <= ((width/2 - ((width/10 * 2) + 15) + width/20))) &&
      (mouseY >= ((height - 12)) - 6.5) && 
      (mouseY <= ((height - 12) + 6.5))))) {
    for(int j = 0; j < color_Palette_Selected.length; j++) {            
       color_Palette_Random_Mono_1[j] = color(int(random(0, 255)));
       color_Palette_Random_Mono_2[j] = color(int(random(0, 255)));
       color_Palette_Random_Mono_3[j] = color(int(random(0, 255)));
    }    
  } 
  
  //if - based on key '4' or in-boundary mouse click, generates a pattern with random colors
  if ((keyPressed && 
      (key == '4')) ||
     (mousePressed &&
      (mouseX >= ((width/2 - ((width/10) + 5) - width/20)) && 
      (mouseX <= ((width/2 - ((width/10) + 5) + width/20))) &&
      (mouseY >= ((height - 20)) - 15) && 
      (mouseY <= ((height - 20) + 15))))) {
        random_Color_Mode = true;
        pattern_Maker();
        endRecord();
  } else { random_Color_Mode = false; }  

  //if - based on key '5' or in-boundary mouse click, generates a pattern with random values
  if ((keyPressed && 
      (key == '5')) ||
     (mousePressed &&
      (mouseX >= ((width/2 - width/20)) && 
      (mouseX <= ((width/2 + width/20))) &&
      (mouseY >= ((height - 20)) - 15) && 
      (mouseY <= ((height - 20) + 15))))) {    
        random_Value_Mode = true;
        pattern_Maker();
        endRecord();    
  } else { random_Value_Mode = false; }
  
  //if - based on key '6' or in-boundary mouse click, generates a pattern with random red values
  if ((keyPressed && 
      (key == '6')) ||
     (mousePressed &&
      (mouseX >= ((width/2 + ((width/10) + 5) - width/20)) && 
      (mouseX <= ((width/2 + ((width/10) + 5) + width/20))) &&
      (mouseY >= ((height - 20)) - 15) && 
      (mouseY <= ((height - 20) + 15))))) {
    random_Red_Value_Mode = true;
    pattern_Maker();
    endRecord();    
  } else { random_Red_Value_Mode = false; }
  
  //if - based on key '7' or in-boundary mouse click, generates a pattern with random green values
  if ((keyPressed && 
      (key == '7')) ||
     (mousePressed &&
      (mouseX >= ((width/2 + ((width/10 * 2) + 10) - width/20)) && 
      (mouseX <= ((width/2 + ((width/10 * 2) + 10) + width/20))) &&
      (mouseY >= ((height - 20)) - 15) && 
      (mouseY <= ((height - 20) + 15))))) {   
    random_Green_Value_Mode = true;
    pattern_Maker();
    endRecord();    
  } else { random_Green_Value_Mode = false; }
  
  //if - based on key '8' or in-boundary mouse click, generates a pattern with random blue values
  if ((keyPressed && 
      (key == '8')) ||
     (mousePressed &&
      (mouseX >= ((width/2 + ((width/10 * 3) + 15) - width/20)) && 
      (mouseX <= ((width/2 + ((width/10 * 3) + 15) + width/20))) &&
      (mouseY >= ((height - 20)) - 15) && 
      (mouseY <= ((height - 20) + 15))))) {   
        random_Blue_Value_Mode = true;
        pattern_Maker();
        endRecord();    
  } else { random_Blue_Value_Mode = false; }
  
  //if - based on key '9' or in-boundary mouse click, generates a pattern with a mono color scheme
  if ((keyPressed && 
      (key == '9')) ||
     (mousePressed &&
      (mouseX >= ((width/2 + ((width/10 * 4) + 20) - width/20)) && 
      (mouseX <= ((width/2 + ((width/10 * 4) + 20) + width/20))) &&
      (mouseY >= ((height - 28)) - 6.5) && 
      (mouseY <= ((height - 28) + 6.5))))) {   
        mono_Mode = true;
        pattern_Maker();
        endRecord();    
  } else { mono_Mode = false; }
  
  //if - based on key '0' or in-boundary mouse click, generates a pattern with an inverted mono color scheme 
  if ((keyPressed && 
      (key == '0')) ||
     (mousePressed &&
      (mouseX >= ((width/2 + ((width/10 * 4) + 20) - width/20)) && 
      (mouseX <= ((width/2 + ((width/10 * 4) + 20) + width/20))) &&
      (mouseY >= ((height - 12)) - 6.5) && 
      (mouseY <= ((height - 12) + 6.5))))) {   
    mono_Invert_Mode = true;
    pattern_Maker();
    endRecord();    
  } else { mono_Invert_Mode = false; }
  
  //function - calls to draw the frame
  frame();
  
  rectMode(CENTER);
  stroke(240, 228, 202);
   
  //rects - draws the buttons on the bottom of the window

  //Moroccan Palette Button
  fill(color_Palette_Mix[2]); rect(width/2 - ((width/10 * 4) + 20),  height - 20, width/10, 30, 5);
  fill(255); textSize(9); text("[1] \nMaroc", width/2 - ((width/10 * 4) + 20),  height - 23);
  
  //Random Color Palette Button
  fill(color_Palette_Random_1[4]); rect(width/2 - ((width/10 * 3) + 15),  height - 28, width/10, 13, 5);
  fill(0); textSize(9); text("[2] Ran.Pat.Col.", width/2 - ((width/10 * 3) + 15),  height - 25);
  //Regenerate Button
  fill(180); rect(width/2 - ((width/10 * 3) + 15),  height - 12, width/10, 13, 5);
  fill(0); textSize(9); text("Regenerate", width/2 - ((width/10 * 3) + 15),  height - 9);
  
  //Random Value Palette Button
  fill(color_Palette_Random_Mono_1[4]); rect(width/2 - ((width/10 * 2) + 10),  height - 28, width/10, 13, 5);
  fill(0); textSize(9); text("[3] Ran.Pat.Val.", width/2 - ((width/10 * 2) + 10),  height - 25);
  //Regenerate Button
  fill(180); rect(width/2 - ((width/10 * 2) + 10),  height - 12, width/10, 13, 5);
  fill(0); textSize(9); text("Regenerate", width/2 - ((width/10 * 2) + 10),  height - 9);

  //Random Color Button
  fill(180); rect(width/2 - (width/10 + 5),  height - 20, width/10, 30, 5);
  fill(0); textSize(9); text("[4] \nRandom Color", width/2 - (width/10 + 5),  height - 23);

  //Random Value Button
  fill(180); rect(width/2, height - 20, width/10, 30, 5); 
  fill(0); textSize(9); text("[5] \nRandom Value", width/2, height - 23);

  //Red Value Button
  fill(230, 96, 91); rect(width/2 + (width/10 + 5),  height - 20, width/10, 30, 5);
  fill(0); textSize(9); text("[6] \nRandom Red", width/2 + (width/10 + 5),  height - 23);

  //Green Value Button
  fill(13, 217, 88); rect(width/2 + ((width/10 * 2) + 10),  height - 20, width/10, 30, 5);
  fill(0); textSize(9); text("[7] \nRandom Green", width/2 + ((width/10 * 2) + 10),  height - 23);

  //Blue Value Button
  fill(91, 101, 240); rect(width/2 + ((width/10 * 3) + 15),  height - 20, width/10, 30, 5);
  fill(0); textSize(9); text("[8] \nRandom Blue", width/2 + ((width/10 * 3) + 15),  height - 23);

  //Mono Invert Button
  fill(0); rect(width/2 + ((width/10 * 4) + 20),  height - 12, width/10, 13, 5);
  fill(255); textSize(9); text("[0] Mono Inv.", width/2 + ((width/10 * 4) + 20),  height - 9);

  //Mono Button
  fill(255); rect(width/2 + ((width/10 * 4) + 20),  height - 28, width/10, 13, 5);
  fill(0); textSize(9); text("[9] Mono", width/2 + ((width/10 * 4) + 20),  height - 25);
  
  noStroke(); 
  
}

//function - draws the tile pattern based on color/value/palette selections
void pattern_Maker(){
 
  //for - creates each row of tile
  for (y_Position = 25; y_Position <= height - 125; y_Position += 100) {
    
    //(nested) for - creates each tile
    for(x_Position = 10; x_Position <= width - 110; x_Position += 100) { 
      
      //ifs - triggers their respective color scheme if true
      if (moroccan_Palette_Mode)     { moroccan_Palette(); }      
      if (random_Color_Palette_Mode) { random_Color_Palette(); }       
      if (random_Value_Palette_Mode) { random_Value_Palette(); }      
      if (random_Color_Mode)         { random_Color(); }
      if (random_Value_Mode)         { random_Value(); }
      if (random_Red_Value_Mode)     { random_RGB_Value(); }      
      if (random_Blue_Value_Mode)    { random_RGB_Value(); }      
      if (random_Green_Value_Mode)   { random_RGB_Value(); }
      if (mono_Mode)                 { mono_Palette(); }  
      if (mono_Invert_Mode)          { mono_Palette(); }
      
      //function - calls to draw the tile   
      tile();
     
    }   
  
  }  
  
}

//function - fills color_Palette_Selected[] with the Moroccan Color Palette
void moroccan_Palette(){
 
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
  
}

//function - fills the color_Palette_Selected[] with the Random Color Palette
void random_Color_Palette(){
 
  switch_Palette = int(random(1, 4));
  
  //ifs & fors - selects the color palette based on the random generation of switch_Palette  
  if (switch_Palette == 1) {        
    for(int j = 0; j < color_Palette_Selected.length; j++) {           
       color_Palette_Selected[j] = color_Palette_Random_1[j];          
    }          
  } else if (switch_Palette == 2) {        
    for(int j = 0; j < color_Palette_Selected.length; j++) {            
       color_Palette_Selected[j] = color_Palette_Random_2[j];          
    }          
  } else if (switch_Palette == 3) {        
    for(int j = 0; j < color_Palette_Selected.length; j++) {            
       color_Palette_Selected[j] = color_Palette_Random_3[j];          
    }          
  }  
  
}

//function - fills the color_Palette_Selected[] with the Random Value Palette 
void random_Value_Palette(){
 
  switch_Palette = int(random(1, 4));
  
  //ifs & fors - selects the color palette based on the random generation of switch_Palette  
  if (switch_Palette == 1) {        
    for(int j = 0; j < color_Palette_Selected.length; j++) {           
       color_Palette_Selected[j] = color_Palette_Random_Mono_1[j];          
    }          
  } else if (switch_Palette == 2) {        
    for(int j = 0; j < color_Palette_Selected.length; j++) {            
       color_Palette_Selected[j] = color_Palette_Random_Mono_2[j];          
    }          
  } else if (switch_Palette == 3) {        
    for(int j = 0; j < color_Palette_Selected.length; j++) {            
       color_Palette_Selected[j] = color_Palette_Random_Mono_3[j];          
    }          
  }  
  
}

//function - fills the color_Palette_Selected[] with random colors 
void random_Color(){
       
  for(int j = 0; j < color_Palette_Selected.length; j++) {            
     color_Palette_Selected[j] = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));          
  }            
  
}

//function - fills the color_Palette_Selected[] with random values
void random_Value(){
       
  for(int j = 0; j < color_Palette_Selected.length; j++) {            
     color_Palette_Selected[j] = int(random(0, 255));          
  }            
  
}

//function - fills the color_Palette_Selected[] with random red, blue, or green values (does not mix the colors)
void random_RGB_Value(){
  
   if (random_Red_Value_Mode) { 
     for(int j = 0; j < color_Palette_Selected.length; j++) {            
       color_Palette_Selected[j] = color(int(random(0, 255)), 0, 0);          
     } 
   }
   
   if (random_Green_Value_Mode) { 
     for(int j = 0; j < color_Palette_Selected.length; j++) {            
       color_Palette_Selected[j] = color(0, int(random(0, 255)), 0);          
     }   
   } 
   
   if (random_Blue_Value_Mode) {      
     for(int j = 0; j < color_Palette_Selected.length; j++) {            
       color_Palette_Selected[j] = color(0, 0, int(random(0, 255)));          
     }     
   }
  
}

//function - fills the color_Palette_Selected[] with either the Mono Palette or Mono Invert Palette
void mono_Palette(){
  
  if(mono_Mode) {  
    for(int j = 0; j < color_Palette_Selected.length; j++) {            
       color_Palette_Selected[j] = color_Palette_Mono[j];          
    }  
  }
  
  if(mono_Invert_Mode) { 
    for(int j = 0; j < color_Palette_Selected.length; j++) {            
      color_Palette_Selected[j] = color_Palette_Mono_Invert[j];          
    }  
  } 

}

//function - draws a single tile
void tile(){

  rectMode(CENTER);
  
  noStroke();
  
  //square - creates the base
  fill(color_Palette_Selected[0]);
  square(50 + x_Position, 50 + y_Position, 100);
  
  //arc - creates the corner arcs
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
  
  //circle - creates centerpiece stroke
  fill(color_Palette_Selected[1]);  
  circle(50 + x_Position, 50 + y_Position, 75);
  circle(17 + x_Position, 50 + y_Position, 35);
  circle(50 + x_Position, 17 + y_Position, 35);
  circle(50 + x_Position, 83 + y_Position, 35);
  circle(83 + x_Position, 50 + y_Position, 35);  
  
  //circle - Creates centerpiece
  fill(color_Palette_Selected[2]);
  circle(50 + x_Position, 50 + y_Position, 65);
  circle(17 + x_Position, 50 + y_Position, 25);
  circle(50 + x_Position, 17 + y_Position, 25);
  circle(50 + x_Position, 83 + y_Position, 25);
  circle(83 + x_Position, 50 + y_Position, 25);
  
  //circle - creates the eye of the centerpiece
  fill(color_Palette_Selected[1]);
  ellipse(50 + x_Position, 50 + y_Position, 50, 25);
  fill(color_Palette_Selected[3]);
  circle(50 + x_Position, 50 + y_Position, 20);
  fill(color_Palette_Selected[4]);
  circle(50 + x_Position, 50 + y_Position, 12);
  fill(color_Palette_Selected[3]);
  circle(53 + x_Position, 47 + y_Position, 6);  
  
  //circle - Creates layer one of the corner circles
  fill(color_Palette_Selected[1]);
  circle(15 + x_Position, 85 + y_Position, 15);
  circle(15 + x_Position, 15 + y_Position, 15);
  circle(85 + x_Position, 15 + y_Position, 15);
  circle(85 + x_Position, 85 + y_Position, 15);  
  
  //circle - Creates layer two of the corner circles
  fill(color_Palette_Selected[3]);
  circle(15 + x_Position, 85 + y_Position, 10);
  circle(15 + x_Position, 15 + y_Position, 10);
  circle(85 + x_Position, 15 + y_Position, 10);
  circle(85 + x_Position, 85 + y_Position, 10);
  
  //circle - creates layer three of the corner circles
  fill(color_Palette_Selected[4]);
  circle(15 + x_Position, 85 + y_Position, 5);
  circle(15 + x_Position, 15 + y_Position, 5);
  circle(85 + x_Position, 15 + y_Position, 5);
  circle(85 + x_Position, 85 + y_Position, 5); 
}

//function - draws the frame
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
  text("Hamz Berg", 56, 18);
  text("Processing Sketch № 14", width - 115, 18);
  text("Level: A", width/2, 18);
  
  //commands - creates bottom content boxes & title text & subtitle text
  fill(225, 216, 188);
  rect(10, height - 100, width - 20, 50, 0, 0, 7, 7);
  rect(10, height - 40, width - 20, 50, 7, 7, 0, 0);
  textSize(22); fill(0);
  text("T[eye]LE Two", width/2, height - 75);
  fill(64); textSize(12);
  text("Click the buttons for a pattern. \'S\' to save to TIF; \'P\' to start PDF record, then click any number once to finish.", width/2, height - 55);
}
