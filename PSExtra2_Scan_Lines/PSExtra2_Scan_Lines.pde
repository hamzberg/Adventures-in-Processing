int x_Position;
int y_Position;

float x_Position_2;
float easing = 0.025;

void setup(){
 
  size(720, 720);
  pixelDensity(displayDensity());
  background(255);
  
}

void draw() {
  
  noStroke();
  
  float dx = mouseX - x_Position_2;
  x_Position_2 += dx * easing;
    
  for (y_Position = 0; y_Position < height; y_Position += 40){   
    
    fill(255, 150, 255, 5);
    //fill(int(random(0,255)), int(random(0, 255)), int(random(0, 255)));
    rect(x_Position, y_Position, width, 20);
    
    fill(255);
    square(x_Position_2, y_Position, 20);
    
  }
  
}
