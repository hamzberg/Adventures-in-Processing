/*
  Author: Hamz Berg
*/

void setup() {
  size(720, 720); 
  background(65, 50, 112); 
  colorMode(HSB, 255);
}

void draw() {
  
  //Color variables based on HSB
  int h = int(random(0, 255));
  int s = int(random(127, 255));
  int b = int(random(127, 255));
  
  //Color assembled from above variables
  color random = color(h, s, b); 
  
  //Random coordinate generators
  int x = int(random(-10, 730));
  int y = int(random(0, 15));
  
  //Random square size generator
  int size = int(random(50, 100));

  noStroke();
  fill(random);    
    
  for (int e = 0; e < 20; e++) {
    
    //Square face base
    square(x, y, size);
    
    //Smile code
    fill(h + 20, s, b + 5);
    ellipse(x + size/3, y + size/4, size/5, size/5);
    ellipse(x + (size/3) * 2, y + size/4, size/5, size/5);
    arc(x + size/2, y + size/2, size/2, size/2, 0, PI);
    fill(h, s, b);
    
    //Shifts square drawing position directly below previous
    y += 1.25 * size;    
    
  }
  
  //Creates the frame
  noStroke();
  fill(255);
  //Left Side
  rect(0,0,25,720);
  //Top Side
  rect(0,0,720, 25);
  //Right Side
  rect(720,720,-25,-720);
  //Bottom Side
  rect(720,720,-720,-50);
  fill(0);
  textSize(18);
  text("Hamz Berg", 23, 18);
  text("Processing Sketch #3", 512, 18);
  textSize(22);
  text("The Joy of Rain", 275, 695); 
  fill(128);
  textSize(12);
  text("\"Rain, rain, come again another day.\"", 255, 710);  
  
}
