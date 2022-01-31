/*
 Author: Hamz Berg
 
 Notes:
   - Color Blue = (40,80,240)
   - Color Purple = (128,128,240) 
   - Line Syntax = (x1,y1,x2,y2);  
*/

void setup() {
  size(960, 480);
  colorMode(HSB, 100);

}

void draw() {
  //Color Scheme ints
  int hA = 11;
  int hC = 339;
  int hD = 105;
  int hE = 84;

  //Color Shade & Brightness & Alpha ints
  int s = mouseY/6;
  int b = 100;
  int a = 10;

  //Coordinate Position ints
  int x = 0;
  int y = 0;

  //Count tracker int
  int count = 0;

  //int used for Circle Diameters
  int size = 25;


  //Screen outputs
  background(hE, 50, 50);

  stroke(0, 0, 0, 0);
  fill(hD, 100, b);

  //Creates row of circles
  for (int i = 0; i < 20; i++) {

    //Creates each circle
    for (int e = 0; e < 20; e++) {

      ellipse(x, y, size, size);
      x += 50;
    }

    //Setup for next row
    count++;
    size--;
    y += 25;

    //Switches row starting position
    if ((count%2) == 1) { 
      x = 25;
    } else if ((count%2) == 0) { 
      x = 0;
    }
  }

  //Reuses x & y int for Smiley Row Generator
  x = 50;
  y = 10;

  //Generates row of Smiles
  for (int j = 0; j < 3; j++) {

    //Circle Face
    fill(hA, s, b);
    stroke(hA, s, b);
    strokeWeight(3);
    ellipse(x + 120, 240 + y, 240, 240);
    
    noStroke();
    
    for (int k = 0; k < 15; k++) {
      fill(hA, s, b, 50 - a);
      ellipse(x + 120, 240 + y, 240, 240);
      y += 20;
    }

    y = 10;

    //Arc Mouth

    fill(hC, s, b);
    arc(x + 120, 240, 180, 180, 0, PI);

    //Circle Eyes
    stroke(0, 0, 0, 0);
    fill(hC, s, b);
    ellipse(x + 60, 200, 50, 50);
    ellipse(x + 180, 200, 50, 50);

    x += 300;
    
  }
  
  
  //Creates the Frame
    noStroke();
    fill(100);
    //Left Side
    rect(0,0,25,480);
    //Top Side
    rect(0,0,960, 25);
    //Right Side
    rect(960,720,-25,-720);
    //Bottom Side
    rect(960,480,-960,-50);
    fill(0);
    textSize(18);
    text("Hamz Berg", 23, 18);
    text("Processing Sketch #1", 750, 18);
    textSize(22);
    text("Color Me Happy", 385, 455); 
    fill(50);
    textSize(12);
    text("Lower your cursor in the window anywhere to reveal the happy worms.", 262, 472);
  
}
