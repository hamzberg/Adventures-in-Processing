/*
  Author: Hamz Berg
*/

//color - stores sketch color scheme
color fresh_Dew       = color(217, 216, 215);
color organic_Dirt    = color(89, 70, 46);
color grounded_Arabia = color(64, 44, 26);
color muted_Love      = color(166, 145, 141);

//int - establishes x and y positions
int y_Position = -25;
int x_Position = 72;

//int - used for switching colors with modulo
int count = 0;

void setup(){
  size(720, 720); 
  pixelDensity(displayDensity());
}

void draw(){
  
  noStroke();
  
  //ellipse - this will have its position and color manipulated
  ellipse(x_Position, y_Position += 12, width/5, width/5);
  
  frame();

  //if - switches color scheme after y_Position is greater than 360
  if (y_Position >= 360) {
    //(nested) if - switches between two colors
    if (count % 2 == 0) {
      fill(grounded_Arabia);
    } else if (count % 2 == 1) {
      fill(organic_Dirt);
    }
  } else { 
    //(nested) if - switches between two colors
    if (count % 2 == 0) {
      fill(fresh_Dew);
    } else if (count % 2 == 1) {
      fill(muted_Love);
    }
  }
  
  //if - prevents pattern from moving beyond width 
  if (y_Position >= width) {    
    y_Position = -25;
    x_Position += 144;  
  }

  //if - breaks pattern at bottom right
  if (x_Position >= width) {
    noLoop();
  }
  
  count++;
}

void frame() {
  
  //Creates the frame
  noStroke(); fill(255);
  
  rect(0,0,25,720);       //Left Side
  rect(0,0,720, 25);      //Top Side
  rect(720,720,-25,-720); //Right Side
  rect(720,720,-720,-50); //Bottom Side
  
  fill(0); textSize(18);
  
  text("Hamz Berg", 23, 18);
  text("Processing Sketch #5", 512, 18);
  textSize(22);
  text("From Cake to Coffee", 245, 695); 
  fill(128);
  textSize(12);
  text("\"Not my slice of cake, but whatever.\"", 250, 710);

  fill(fresh_Dew);       rect(25, 690, 20, 60);
  fill(muted_Love);      rect(45, 690, 20, 60);
  fill(organic_Dirt);    rect(65, 690, 20, 60);
  fill(grounded_Arabia); rect(85, 690, 20, 60);

}
