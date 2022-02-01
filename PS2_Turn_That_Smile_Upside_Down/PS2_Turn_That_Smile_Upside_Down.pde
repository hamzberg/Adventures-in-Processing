/*
  Author: Hamz Berg
*/

void setup(){ size(720,720); }

void draw(){
  
  //ints to track coordinates
  int x = 0;
  int y = 10;
  
  //int to keep row count
  int count = 0;
  
  //ints to constrain the Height of arc
  int const_Arc_Height = constrain(mouseY/4, 0, 167);
  int const_Mini_Arc_Height = constrain(mouseY/64, 0, 10);
  
  //ints to constrain the rise of arc
  int const_Arc_Rise = constrain(mouseY/16, 0, 42);
  int const_Mini_Arc_Rise = constrain(mouseY/128, 0, 5);
  
  //Repeated setup
  background(102, 102, 255);
  stroke(0);
  strokeWeight(5);

  //Creates row
  for(int i = 0; i < 16; i++){
    
    //Creates item
    for(int e = 0; e < 14; e++){
    
    //Creates mini smiley
    fill(123,(mouseY - 75),150);
    ellipse(x,y,50,50);
    noFill();
    //arc reacts to mouseY location through variables
    arc(x , y - const_Mini_Arc_Rise, 25, const_Mini_Arc_Height, PI, TWO_PI);
    fill(0);
    ellipse(x + 7, y + 10, 5, 5);
    ellipse(x - 7, y + 10, 5, 5);
    
    //Moves over to next space
    x += 55;
   
    }

    //Counts row end & lowers row
    count++;
    y += 45; 
    
    //Switches row starting position
    if ((count%2) == 1) { 
      x = 25;
    } else if ((count%2) == 0) { 
      x = 0;
    }
    
  }
  
  //Detects if any mouse button is pressed, reacts accordingly
  if (mousePressed == true) {
   
    //Creates the upside big Smiley
    stroke(0);
    strokeWeight(25);
    fill(123,(mouseY - 75),350);
    ellipse(360,360,360,360);
    noFill();
    arc(360, 380 - const_Arc_Rise, 220, const_Arc_Height, PI, TWO_PI);
    fill(0);
    ellipse(420, 420, 25, 25);
    ellipse(300, 420, 25, 25);
     
   } else {
     
    //Creates the downside big Smiley
    stroke(0);
    strokeWeight(25);
    fill(123,(mouseY - 75),350);
    ellipse(360,360,360,360);
    noFill();
    arc(360, 400 - const_Arc_Rise, 220, const_Arc_Height, 0, PI);
    fill(0);
    ellipse(420, 300, 25, 25);
    ellipse(300, 300, 25, 25);
     
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
  text("Processing Sketch #2", 512, 18);
  textSize(22);
  text("Turn that Smile Upside Down", 205, 695); 
  fill(128);
  textSize(12);
  text("Click and hold any mouse button to flip the big smiley.", 202, 710);
    
}
