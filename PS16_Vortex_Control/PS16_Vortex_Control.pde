/*
  Author:
    hamzberg
  
  Thoughts:
    Not sure why, but this program runs better on MacOS than on Windows 10.
    The font seems to change from Arial to another font, not sure what it is,
    but does make it difficult to see what the user is clicking on. I also tried
    implementing PGraphics to fix the over-the-UI problem but that didn't fix it.
    I'm sure it's possible, but would require much more time to implement.    
*/

float speed = 0.05;

float z_Rotation_Amount = 0;
float x_Rotation_Amount = 0;
float y_Rotation_Amount = 0;

void setup() {
  size(1440, 720, P3D);
  pixelDensity(displayDensity());
  frameRate(120);
  background(255);
}

void draw() {
  
  noStroke(); 
   
  frame();
  controls();

  //floats - always increasing to give constant animation
  z_Rotation_Amount += speed;
  x_Rotation_Amount += speed;
  y_Rotation_Amount += speed;
  
  //translate - positions canvas to center of window
  translate(width/2, height/2);  
  
  //for - creates the vortex to be manipulated on each axis
  for (float i = 0; i < 10; i += 0.1){
    
    //fill - creates a gradiant from sky blue to red
    fill(0 + i*50, 255 - i*50, 255 - i*50);
    
    rotateZ(radians(z_Rotation_Amount - i));
    rotateY(radians(y_Rotation_Amount - i));
    rotateX(radians(x_Rotation_Amount - i));
    
    //circle - use the easeInOutSine to manipulate diameters
    circle(0 + i*100, 0, (-(cos(2 * PI * i) - 1) * 18));    
  }
  
}

void controls() {
  
  //ifs - allows manipulation of variable based on left mouse button pressed within boundaries
  if (mouseButton == LEFT && (mouseY >= 680 && mouseY <= 700)) {     
    if(mouseX >= 20 && mouseX <= 40){ 
      x_Rotation_Amount += 0.1; 
    }    
    if(mouseX >= 50 && mouseX <= 70){
      x_Rotation_Amount -= 0.15; 
    }    
    if(mouseX >= 80 && mouseX <= 100){ 
      y_Rotation_Amount += 0.1; 
    }    
    if(mouseX >= 110 && mouseX <= 130){ 
      y_Rotation_Amount -= 0.15; 
    }    
    if(mouseX >= 140 && mouseX <= 160){ 
      z_Rotation_Amount += 0.1; 
    }    
    if(mouseX >= 170 && mouseX <= 190){ 
      z_Rotation_Amount -= 0.15;  
    }    
    if(mouseX >= 200 && mouseX <= 220){ 
      speed += 0.01;  
    }    
    if(mouseX >= 230 && mouseX <= 250){ 
      speed -= 0.01;  
    } 
    
  }
  
 textSize(10);
 
 //rect - left UI background
 fill(50);
 rect(10, height - 100, width - 1190, 90, 0, 0, 7, 7);

 fill(0);
 //rects - UI for rotating the x-axis
 rect(20, height - 40, 22, 20, 5);
 rect(48, height - 40, 22, 20, 5);
 rect(20, height - 65, 50, 20, 5);
 rect(20, height - 90, 50, 20, 5);
 
 //rects - UI for rotating the y-axis
 rect(80, height - 40, 22, 20, 5);
 rect(108, height - 40, 22, 20, 5);
 rect(80, height - 65, 50, 20, 5);
 rect(80, height - 90, 50, 20, 5);
 
 //rects - UI for rotating the z-axis
 rect(140, height - 40, 22, 20, 5);
 rect(168, height - 40, 22, 20, 5);
 rect(140, height - 65, 50, 20, 5);
 rect(140, height - 90, 50, 20, 5);
 
 //rects - UI for in/decreasing the speed
 rect(200, height - 40, 22, 20, 5);
 rect(228, height - 40, 22, 20, 5);
 rect(200, height - 65, 50, 20, 5);
 rect(200, height - 90, 50, 20, 5);
 
 fill(255);
 //texts - labels and counters for each button and UI element
 text("Rotate X", 055, height - 75); text(int(x_Rotation_Amount), 055, height - 50); text("+       -", 055, height - 25);
 text("Rotate Y", 105, height - 75); text(int(y_Rotation_Amount), 105, height - 50); text("+       -", 105, height - 25); 
 text("Rotate Z", 165, height - 75); text(int(z_Rotation_Amount), 165, height - 50); text("+       -", 165, height - 25); 
 text("Speed", 225, height - 75); text(speed, 225, height - 50); text("+       -", 225, height - 25); 

}

void frame() {
  
  //commands - establishes frame startup settings
  noStroke();
  fill(0);
  blendMode(REPLACE);
  textAlign(CENTER);
  colorMode(RGB, 255);
  rectMode(CORNER);
  
  //rects - creates border
  rect(0, 0, 10, height); //Left Side
  rect(0, 0, width, 25); //Top Side
  rect(width, height, -10, -height); //Right Side
  rect(width, height, -width, -100); //Bottom Side

  //texts - creates top texts
  fill(255); textSize(18);
  text("hamzberg", 52, 18);
  text("Processing Sketch № 16", width - 115, 18);
  text("Level: A", width/2, 18);
  
  //commands - creates bottom content boxes & title text & subtitle text
  fill(50);
  rect(270, height - 100, width - 280, 90, 0, 0, 7, 7);
  textSize(22); fill(255);
  text("Vortex Control", width/2, height - 75);
  textSize(12); 
  text("Use the buttons on the left side to manipulate the rotation & speed of the Vortex.", width/2, height - 55);
  
}
