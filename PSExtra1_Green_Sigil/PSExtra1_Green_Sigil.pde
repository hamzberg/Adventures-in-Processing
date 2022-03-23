float x_Position;
float y_Position;
float easing = 0.005;

void setup() {
 
  size(720, 720);
  pixelDensity(displayDensity());
  background(234, 67, 13);
  
}

void draw() {

  float dx = mouseX - x_Position;
  x_Position += dx * easing;
  
  float dy = mouseY - y_Position;
  y_Position += dy * easing;

  noStroke();
  fill(234, 67, 13, 5);
  square(0, 0, 720);
  
  stroke(23, 67, 13);
  strokeWeight(5);
  circle(x_Position, y_Position, 50);
  circle(x_Position - 40, y_Position - 40, 50);
  circle(x_Position + 40, y_Position - 40, 50);
  circle(x_Position - 40, y_Position + 40, 50);
  circle(x_Position + 40, y_Position + 40, 50);
  
  circle(x_Position - 85, y_Position, 25);
  circle(x_Position + 85, y_Position, 25);
  circle(x_Position, y_Position + 85, 25);
  circle(x_Position, y_Position - 85, 25);
  
  println("dx: " + dx + "\ndy: " + dy);
  println("\nx_Position: " + x_Position + "\ny_Position: " + y_Position);

}
