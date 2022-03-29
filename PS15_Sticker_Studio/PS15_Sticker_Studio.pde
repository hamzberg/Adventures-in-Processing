/*
  Author: hamzberg
*/

PImage[] portfolio_Elements = new PImage[5];
PImage[] UI_Elements = new PImage[6];

PGraphics
  image_Mushroom,
  image_Smiley,
  image_Sunflower,
  image_Luna,
  image_Rainbow,
  ui_Left_Clicked,
  ui_Left_Unclicked,
  ui_Right_Clicked,
  ui_Right_Unclicked,
  ui_Circle_Clicked,
  ui_Circle_Unclicked;

int image_Select = 0;
int image_Scale = 1;

int blendMode_Select = 0;
String blendMode_Select_Number = "";
  
color[] color_Palette_Psych = { 
  color(255, 255, 0),
  color(165, 0, 177),
  color(255, 0, 151),
  color(0, 185, 211),
  color(0, 96, 173)  
};

color[] random_Position_Palette = {
  color(75),
  color(125),
  color(165),
  color(215),
  color(250)  
}; 

void setup() {
  
  size(900, 720);
  pixelDensity(displayDensity());    
  imageMode(CENTER);
  background(255);
  
  //PGraphics - creates canvas for each portfolio element 
  image_Mushroom  = createGraphics(720, 720); 
  image_Smiley    = createGraphics(720, 720); 
  image_Sunflower = createGraphics(720, 720); 
  image_Luna      = createGraphics(720, 720); 
  image_Rainbow   = createGraphics(720, 720); 
  
  //PGraphics - creates canvas for each UI element 
  ui_Left_Clicked    = createGraphics(240, 240); 
  ui_Left_Unclicked  = createGraphics(240, 240); 
  ui_Right_Clicked   = createGraphics(240, 240); 
  ui_Right_Unclicked = createGraphics(240, 240); 
  ui_Circle_Clicked   = createGraphics(240, 240); 
  ui_Circle_Unclicked = createGraphics(240, 240); 
  
  //functions - creates UI & portfolio elements 
  create_Portfolio();
  create_UI_Elements();
  
  //PImage - loads images into portfolio_Elements[]
  portfolio_Elements[0] = loadImage("image_Mushroom.PNG");
  portfolio_Elements[1] = loadImage("image_Smiley.PNG");
  portfolio_Elements[2] = loadImage("image_Sunflower.PNG");
  portfolio_Elements[3] = loadImage("image_Luna.PNG");
  portfolio_Elements[4] = loadImage("image_Rainbow.PNG");
  
  //PImage - loads images into UI_Elements[]
  UI_Elements[0] = loadImage("ui_Left_Clicked.PNG");
  UI_Elements[1] = loadImage("ui_Left_Unclicked.PNG");
  UI_Elements[2] = loadImage("ui_Right_Clicked.PNG");
  UI_Elements[3] = loadImage("ui_Right_Unclicked.PNG");
  UI_Elements[4] = loadImage("ui_Circle_Clicked.PNG");
  UI_Elements[5] = loadImage("ui_Circle_Unclicked.PNG");
  
  //function - displays the sticker frame & regular frame
  sticker_Frame();
  frame();
  
}

void draw() {  

  //function - redraws frame UI every frame
  frame();
  
  //if - using int image_Select to parse the portfolio_Elements[], displays respective PImage & text in top left box
  if (image_Select == 0) {
    sticker_Frame();
    image(portfolio_Elements[0], 95, 110, width/5.625, height/4.5);    
    text("Mushroom\nSticker", 96, 225);
  } else if (image_Select == 1) {
    sticker_Frame();
    image(portfolio_Elements[1], 95, 110, width/5.625, height/4.5);
    text("Smiley\nSticker", 96, 225);
  } else if (image_Select == 2) {
    sticker_Frame();
    image(portfolio_Elements[2], 95, 110, width/5.625, height/4.5);
    text("Sunflower\nSticker", 96, 225); 
  } else if (image_Select == 3) {
    sticker_Frame();
    image(portfolio_Elements[3], 95, 110, width/5.625, height/4.5); 
    text("Luna\nSticker", 96, 225); 
  } else if (image_Select == 4) {
    sticker_Frame();
    image(portfolio_Elements[4], 95, 110, width/5.625, height/4.5);
    text("Rainbow\nSticker", 96, 225);
  }
  
  //text - displays respective number for image_Select, blendMode_Select, & image_Scale
  text((image_Select + 1) + "/5", 95, 295);
  text((blendMode_Select + 1) + "/5", 95, 595);
  text(image_Scale + "x", 155, 375);
  
  //if - displays respective name for blendMode_Select
  if(blendMode_Select == 0) { 
    fill(255); rect(10, 625, 170, 50, 10);
    fill(0); text("REPLACE", 95, 655);
  } else if (blendMode_Select == 1) { 
    fill(255); rect(10, 625, 170, 50, 10);
    fill(0); text("MULTIPLY", 95, 655);
  } else if (blendMode_Select == 2) { 
    fill(255); rect(10, 625, 170, 50, 10);
    fill(0); text("SCREEN", 95, 655);
  } else if (blendMode_Select == 3) { 
    fill(255); rect(10, 625, 170, 50, 10);
    fill(0); text("LIGHTEST", 95, 655);
  } else if (blendMode_Select == 4) {
    fill(255); rect(10, 625, 170, 50, 10);
    fill(0); text("DARKEST", 95, 655);
  } 
  
}

void mouseWheel(MouseEvent event) {
 
  //commands - gets mouse wheel input & de/increases int image_Scale within 1 to 4 range
  image_Scale += event.getCount();
  if (image_Scale <= 0) { image_Scale = 1; }
  if (image_Scale >= 5) { image_Scale = 4; } 
  
}

void mouseReleased() {

  //if - displays clicked left UI button & decreases image_Select, resetting to 4 if below 0
  if ((mouseButton == LEFT) && 
      (mouseX >= 10 && mouseX <= 60) && 
      (mouseY >= 265 && mouseY <= 315)) { 
    image_Select--;
    image(UI_Elements[0], 35, 290, 50, 50);    
    if(image_Select < 0) { image_Select = 4; }
  }
  
  //if - displays clicked right UI button & increases image_Select, resetting to 0 if above 4
  if ((mouseButton == LEFT) && 
      (mouseX >= 130 && mouseX <= 180) && 
      (mouseY >= 265 && mouseY <= 315)) { 
    image_Select++;
    image(UI_Elements[2], 155, 290, 50, 50);
    if(image_Select > 4) { image_Select = 0; }
  }
  
  //if - displays sticker, with respective blendMode, on canvas corresponding to mouse x-axis & y-axis position
  if ((mouseButton == LEFT) && 
      (mouseX >= 190 && mouseX <= 890) && 
      (mouseY >= 25 && mouseY <= 620)) {        
    if(blendMode_Select == 0) { blendMode(REPLACE); }
    else if (blendMode_Select == 1) { blendMode(MULTIPLY); }
    else if (blendMode_Select == 2) { blendMode(SCREEN); }
    else if (blendMode_Select == 3) { blendMode(LIGHTEST); }
    else if (blendMode_Select == 4) { blendMode(DARKEST); }       
    image(portfolio_Elements[image_Select], mouseX, mouseY, (width/5.625) * image_Scale, (height/4.5) * image_Scale);
  }
  
  //if - clears canvas with a size-exact rectangle
  if ((mouseButton == RIGHT) && 
      (mouseX >= 190 && mouseX <= 890) && 
      (mouseY >= 25 && mouseY <= 620)) {        
    blendMode(REPLACE); fill(255);        
    rect(190, 25, 700, 595);
  } 
  
  //if - recreates the PImages in the portfolio_Elements[] with new ones corresponding to the new random_Position_Palette[]
  if ((mouseButton == LEFT) && 
      (mouseX >= 130 && mouseX <= 180) && 
      (mouseY >= 425 && mouseY <= 475)) {
    for (int i = 0; i < random_Position_Palette.length; i++) { random_Position_Palette[i] = color_Palette_Psych[int(random(-1, 5))]; }
    create_Portfolio();
    portfolio_Elements[0] = loadImage("image_Mushroom.PNG");
    portfolio_Elements[1] = loadImage("image_Smiley.PNG");
    portfolio_Elements[2] = loadImage("image_Sunflower.PNG");
    portfolio_Elements[3] = loadImage("image_Luna.PNG");
    portfolio_Elements[4] = loadImage("image_Rainbow.PNG");
    image(UI_Elements[5], 155, 450, 50, 50);
  }
  
  //if - displays clicked left UI button & decreases blendMode_Select, resetting to 4 if below 0
  if ((mouseButton == LEFT) && 
      (mouseX >= 10 && mouseX <= 60) && 
      (mouseY >= 565 && mouseY <= 615)) { 
    blendMode_Select--;
    image(UI_Elements[0], 35, 590, 50, 50);      
    if(blendMode_Select < 0) { blendMode_Select = 4; }
  }
  
  //if - displays clicked right UI button & increases blendMode_Select, resetting to 0 if above 4
  if ((mouseButton == LEFT) && 
      (mouseX >= 130 && mouseX <= 180) && 
      (mouseY >= 565 && mouseY <= 615)) { 
    blendMode_Select++;
    image(UI_Elements[2], 155, 590, 50, 50);
    if(blendMode_Select > 4) { blendMode_Select = 0; }
  }    

}

//function - creates each portfolio element and outputs them to PNG
void create_Portfolio() {
 
  //commands - creates the Mushroom graphic
  image_Mushroom.beginDraw();
    image_Mushroom.noStroke(); image_Mushroom.fill(0);
    image_Mushroom.ellipse(360, 580, 250, 250);
    image_Mushroom.ellipse(360, 460, 200, 200);
    image_Mushroom.ellipse(360, 240, 600, 400);
    image_Mushroom.fill(random_Position_Palette[0]);
    image_Mushroom.ellipse(360, 580, 225, 225);
    image_Mushroom.ellipse(360, 460, 175, 175);
    image_Mushroom.fill(random_Position_Palette[2]);
    image_Mushroom.ellipse(360, 240, 575, 375);
    image_Mushroom.fill(random_Position_Palette[1]); image_Mushroom.ellipse(360, 335, 250, 150);
    image_Mushroom.fill(255); image_Mushroom.ellipse(360, 340, 240, 140);
    image_Mushroom.fill(random_Position_Palette[2]); image_Mushroom.ellipse(360, 340, 80, 140);
    image_Mushroom.fill(random_Position_Palette[1]); image_Mushroom.ellipse(360, 340, 40, 100);
    image_Mushroom.fill(random_Position_Palette[2]); image_Mushroom.ellipse(360, 300, 20, 20); 
    image_Mushroom.ellipse(360, 330, 15, 20);
    image_Mushroom.noFill(); image_Mushroom.stroke(random_Position_Palette[1]); image_Mushroom.strokeWeight(5);
    for (int i = 0; i <= 250; i += 50) { image_Mushroom.arc(360, 240, 570, 125 + i, PI, PI*2); }
    for (int i = 0; i <= 200; i += 50) { image_Mushroom.arc(360, 240, 570 - i, 375, HALF_PI, PI + HALF_PI); }
    for (int i = 0; i <= 200; i += 50) { image_Mushroom.arc(360, 240, 570 - i, 375, PI + HALF_PI, PI*2 + HALF_PI); }
    image_Mushroom.noStroke();
    image_Mushroom.fill(random_Position_Palette[1]); image_Mushroom.ellipse(360, 595, 200, 175);
    image_Mushroom.fill(random_Position_Palette[0]); image_Mushroom.ellipse(360, 575, 200, 175);
    image_Mushroom.fill(random_Position_Palette[1]); image_Mushroom.ellipse(320, 455, 55, 45);
    image_Mushroom.fill(random_Position_Palette[0]); image_Mushroom.ellipse(330, 465, 55, 45);
    image_Mushroom.fill(random_Position_Palette[1]); image_Mushroom.ellipse(325, 455, 15, 40);
    image_Mushroom.fill(random_Position_Palette[1]); image_Mushroom.ellipse(400, 455, 55, 45);
    image_Mushroom.fill(random_Position_Palette[0]); image_Mushroom.ellipse(390, 465, 55, 45);
    image_Mushroom.fill(random_Position_Palette[1]); image_Mushroom.ellipse(395, 455, 15, 40);
    image_Mushroom.ellipse(360, 490, 50, 20);
    image_Mushroom.fill(random_Position_Palette[0]); image_Mushroom.ellipse(360, 485, 50, 20);
  image_Mushroom.endDraw();
  image_Mushroom.save("data/image_Mushroom.PNG");
  
  //commands - creates the Smiley graphic
  image_Smiley.beginDraw();
    image_Smiley.rectMode(CENTER);
    image_Smiley.noStroke();
    image_Smiley.fill(0);
    image_Smiley.circle(360, 280, 540);
    image_Smiley.circle(360, 645, 25);
    image_Smiley.rect(360, 580, 25, 85, 999);
    image_Smiley.circle(360, 645, 25);
    image_Smiley.circle(360, 675, 15);
    image_Smiley.circle(360, 695, 5);
    image_Smiley.circle(320, 545, 25);
    image_Smiley.rect(320, 580, 15, 150, 999);
    image_Smiley.rect(240, 540, 25, 250, 999);
    image_Smiley.circle(180, 460, 55);
    image_Smiley.rect(180, 500, 35, 100, 999);
    image_Smiley.circle(180, 575, 35);
    image_Smiley.circle(180, 610, 20);
    image_Smiley.circle(180, 635, 10);
    image_Smiley.rect(480, 540, 35, 300, 999);
    image_Smiley.rect(450, 500, 15, 290, 999);
    image_Smiley.circle(450, 660, 15); 
    image_Smiley.circle(450, 680, 10);
    image_Smiley.circle(450, 695, 5);
    image_Smiley.circle(540, 470, 30);
    image_Smiley.rect(540, 480, 15, 300, 999);    
    image_Smiley.fill(random_Position_Palette[0]);
    image_Smiley.rect(360, 560, 10, 105, 999);
    image_Smiley.circle(360, 645, 10);
    image_Smiley.circle(360, 675, 5);
    image_Smiley.rect(320, 525, 15, 50, 999);
    image_Smiley.rect(320, 580, 5, 135, 999);
    image_Smiley.rect(240, 540, 10, 235, 999);
    image_Smiley.rect(180, 440, 35, 75, 999);
    image_Smiley.rect(180, 500, 20, 85, 999);
    image_Smiley.circle(180, 575, 20);
    image_Smiley.circle(180, 610, 5);
    image_Smiley.rect(480, 540, 15, 280, 999);
    image_Smiley.rect(450, 500, 5, 275, 999);
    image_Smiley.circle(450, 660, 5); 
    image_Smiley.rect(540, 450, 20, 60, 999);
    image_Smiley.rect(540, 480, 5, 290, 999);
    image_Smiley.circle(360, 280, 480);
    image_Smiley.noFill(); image_Smiley.stroke(random_Position_Palette[1]); image_Smiley.strokeWeight(8);
    for (int i = 0; i <= 480; i += 80) { image_Smiley.arc(360, 280, 480 - i, 480, HALF_PI, PI + HALF_PI); }
    for (int i = 480; i > 0; i -= 80) { image_Smiley.arc(360, 280, 0 + i, 480, PI + HALF_PI, PI*2 + HALF_PI); }
    for (int i = 0; i <= 480; i += 80) { image_Smiley.arc(360, 280, 480, 480 - i, 0, PI); }
    for (int i = 480; i > 0; i -= 80) { image_Smiley.arc(360, 280, 480, 0 + i, PI, PI*2); }
    image_Smiley.noStroke(); image_Smiley.fill(0);
    image_Smiley.circle(240, 220, 50);
    image_Smiley.circle(480, 220, 50);
    image_Smiley.noFill(); image_Smiley.stroke(0); image_Smiley.strokeWeight(7);
    image_Smiley.circle(240, 220, 75);
    image_Smiley.circle(240, 220, 100);
    image_Smiley.circle(240, 220, 125);
    image_Smiley.circle(480, 220, 75);
    image_Smiley.circle(480, 220, 100);
    image_Smiley.circle(480, 220, 125);
    image_Smiley.strokeWeight(20);
    image_Smiley.arc(360, 320, 380, 240, 0, PI);
    image_Smiley.arc(360, 320, 380, 200, 0, PI);
    image_Smiley.strokeWeight(15);
    image_Smiley.arc(200, 355, 100, 100, PI, PI + HALF_PI);
    image_Smiley.arc(520, 355, 100, 100, PI + HALF_PI, PI*2);
    image_Smiley.noStroke(); image_Smiley.fill(0);
    image_Smiley.rect(480, 420, 15, 60, 999);
    image_Smiley.rect(240, 440, 10, 80, 999);
    image_Smiley.rect(450, 440, 5, 75, 999);
  image_Smiley.endDraw();
  image_Smiley.save("data/image_Smiley.PNG");
   
  //commands - creates the Sunflower graphic
  image_Sunflower.beginDraw();
    int fill_Switch = 0;
    image_Sunflower.noStroke();
    for (int i = 0; i < 135; i += 45){
      if (fill_Switch % 2 == 0) { image_Sunflower.fill(0); } 
        else if (fill_Switch % 2 == 1) { image_Sunflower.fill(random_Position_Palette[1]); }
      image_Sunflower.circle(360, 360, 360 - i);    
      image_Sunflower.circle(360, 540, 180 - i);
      image_Sunflower.circle(540, 360, 180 - i);
      image_Sunflower.circle(360, 180, 180 - i);
      image_Sunflower.circle(180, 360, 180 - i);  
      image_Sunflower.circle(480, 480, 180 - i);
      image_Sunflower.circle(240, 240, 180 - i);
      image_Sunflower.circle(480, 240, 180 - i);
      image_Sunflower.circle(240, 480, 180 - i);
      fill_Switch++; 
    }
    image_Sunflower.fill(random_Position_Palette[1]); image_Sunflower.circle(415, 305, 110);
    image_Sunflower.noFill(); image_Sunflower.stroke(0); image_Sunflower.strokeWeight(5);
    image_Sunflower.arc(415, 300, 65, 35, PI, PI*2 + QUARTER_PI/2);
    image_Sunflower.arc(415, 300, 65, 30, PI, PI*2);
    image_Sunflower.arc(415, 300, 65, 25, PI, PI*2);
    image_Sunflower.arc(435, 280, 20, 20, 0, HALF_PI);
    image_Sunflower.arc(445, 285, 20, 20, 0, HALF_PI);
    image_Sunflower.noStroke(); image_Sunflower.fill(0);
    image_Sunflower.ellipse(415, 305, 15, 40);
    image_Sunflower.ellipse(415, 305, 40, 15);
    image_Sunflower.noFill(); image_Sunflower.stroke(random_Position_Palette[1]); image_Sunflower.strokeWeight(5);
    image_Sunflower.arc(305, 300, 65, 35, HALF_PI + QUARTER_PI + QUARTER_PI/2, PI);
    image_Sunflower.arc(305, 300, 65, 30, PI, PI*2);
    image_Sunflower.arc(305, 300, 65, 25, PI, PI*2);
    image_Sunflower.arc(285, 280, 20, 20, HALF_PI, PI);
    image_Sunflower.arc(275, 285, 20, 20, HALF_PI, PI);
    image_Sunflower.noStroke(); image_Sunflower.fill(random_Position_Palette[1]);
    image_Sunflower.ellipse(305, 305, 15, 40);
    image_Sunflower.ellipse(305, 305, 40, 15);
    image_Sunflower.noFill(); image_Sunflower.stroke(random_Position_Palette[1]); image_Sunflower.strokeWeight(5);
    for (int i = 5; i <= 30; i += 5){ image_Sunflower.arc(360, 380, 180, 125 - i, 0, PI); }
  image_Sunflower.endDraw();
  image_Sunflower.save("data/image_Sunflower.PNG");
 
  //commands - creates the Luna graphic
  image_Luna.beginDraw();
    image_Luna.rectMode(CENTER);
    image_Luna.noStroke(); 
    image_Luna.fill(0); image_Luna.circle(360, 420, 580);
    image_Luna.fill(random_Position_Palette[1]); image_Luna.circle(360, 420, 540);
    image_Luna.fill(random_Position_Palette[2]); image_Luna.circle(360, 400, 500);
    image_Luna.stroke(random_Position_Palette[3]); image_Luna.strokeWeight(10); image_Luna.noFill();
    image_Luna.circle(220, 480, 100);
    image_Luna.circle(420, 220, 75);
    image_Luna.circle(460, 520, 120);
    image_Luna.circle(220, 260, 25);
    image_Luna.circle(500, 380, 25);
    image_Luna.circle(280, 580, 25);
    image_Luna.noFill(); image_Luna.stroke(random_Position_Palette[1]); image_Luna.strokeWeight(5);
    for (int i = 0; i <= 40; i += 5) { image_Luna.arc(360, 420, 360, 180 - i, 0, PI); }
    for (int i = 0; i <= 20; i += 5) { image_Luna.arc(360, 470, 40, 60 - i, 0, PI); }
    for (int i = 0; i <= 20; i += 5) { image_Luna.arc(360, 560, 100, 80 - i, 0, PI); }
    for (int i = 0; i <= 20; i += 5) { image_Luna.arc(360, 420, 50, 50 - i, 0, PI); }
    for (int i = 0; i <= 20; i += 5) { image_Luna.arc(320, 430, 35, 45 - i, PI, PI*2); }
    for (int i = 0; i <= 20; i += 5) { image_Luna.arc(401, 430, 35, 45 - i, PI, PI*2); }
    image_Luna.line(385, 420, 380, 360);
    image_Luna.stroke(random_Position_Palette[0]); image_Luna.fill(random_Position_Palette[2]); 
    image_Luna.strokeWeight(10); image_Luna.ellipse(260, 320, 25, 50);
    image_Luna.noFill(); image_Luna.stroke(random_Position_Palette[1]); 
    image_Luna.strokeWeight(5);
    for (int i = 0; i <= 20; i += 5) { image_Luna.arc(260, 320, 125, 65 - i, PI, PI*2); }
    image_Luna.stroke(random_Position_Palette[0]); image_Luna.fill(random_Position_Palette[2]); 
    image_Luna.strokeWeight(10); image_Luna.ellipse(460, 320, 25, 50);
    image_Luna.noFill(); image_Luna.stroke(random_Position_Palette[1]); 
    image_Luna.strokeWeight(5);
    for (int i = 0; i <= 20; i += 5) { image_Luna.arc(460, 320, 125, 65 - i, PI, PI*2); }
    image_Luna.noFill(); image_Luna.stroke(random_Position_Palette[0]);
    for (int i = 0; i <= 30; i += 5) { image_Luna.arc(260, 280, 175, 85 - i, PI, PI*2); }
    for (int i = 0; i <= 30; i += 5) { image_Luna.arc(460, 280, 175, 85 - i, PI, PI*2); }
    for (int i = 0; i <= 30; i += 5) { image_Luna.arc(350, 490, 225, 85 - i, PI, PI + HALF_PI); }
    for (int i = 0; i <= 30; i += 5) { image_Luna.arc(370, 490, 225, 85 - i, PI + HALF_PI, PI*2); }
    image_Luna.noStroke(); image_Luna.fill(0);
    image_Luna.ellipse(360, 180, 400, 100);
    image_Luna.rect(360, 120, 280, 160, 35);
    image_Luna.ellipse(360, 60, 280, 80); 
    image_Luna.noStroke(); image_Luna.fill(random_Position_Palette[0]);
    image_Luna.ellipse(360, 180, 360, 60);
    image_Luna.rect(360, 120, 240, 120);
    image_Luna.ellipse(360, 60, 240, 40);
  image_Luna.endDraw();
  image_Luna.save("data/image_Luna.PNG");
 
  //commands - creates the Rainbow graphic
  image_Rainbow.beginDraw();
    image_Rainbow.rectMode(CENTER);    
    image_Rainbow.fill(0);
    image_Rainbow.ellipse(360, 420, 550, 450);
    image_Rainbow.ellipse(360, 260, 470, 250);
    image_Rainbow.noFill(); image_Rainbow.stroke(0); 
    image_Rainbow.strokeWeight(30); 
    image_Rainbow.arc(360, 230, 500, 320, QUARTER_PI/2, PI - QUARTER_PI/2);
    image_Rainbow.strokeWeight(100);
    image_Rainbow.arc(150, 185, 150, 150, PI , PI*2);
    image_Rainbow.arc(165, 170, 230, 230, PI + HALF_PI, PI*2);
    image_Rainbow.arc(220, 160, 230, 280, PI + HALF_PI + QUARTER_PI, PI*2);
    image_Rainbow.arc(505, 160, 230, 280, PI, PI + QUARTER_PI);
    image_Rainbow.arc(560, 170, 230, 230, PI, PI + HALF_PI);
    image_Rainbow.arc(575, 185, 150, 150, PI, PI*2);    
    image_Rainbow.noStroke(); image_Rainbow.fill(random_Position_Palette[0]);
    image_Rainbow.ellipse(360, 420, 500, 400);
    image_Rainbow.noFill(); image_Rainbow.stroke(random_Position_Palette[0]); 
    image_Rainbow.strokeWeight(5);    
    image_Rainbow.fill(random_Position_Palette[0]);  
    image_Rainbow.arc(360, 260, 420, 200, PI, PI*2); 
    image_Rainbow.arc(360, 260, 420, 200, 0, PI);
    image_Rainbow.fill(random_Position_Palette[1]); 
    image_Rainbow.arc(360, 260, 320, 150, PI, PI*2); 
    image_Rainbow.arc(360, 260, 320, 150, 0, PI);
    image_Rainbow.fill(random_Position_Palette[1]); 
    image_Rainbow.arc(360, 260, 320, 150, 0, PI);    
    image_Rainbow.noStroke();
    image_Rainbow.fill(125, 61, 167); image_Rainbow.rect(225, 260, 50, 140); 
    image_Rainbow.fill(78, 65, 166); image_Rainbow.rect(280, 260, 50, 180);
    image_Rainbow.fill(79, 140, 94); image_Rainbow.rect(335, 260, 50, 200);
    image_Rainbow.fill(242, 179, 61); image_Rainbow.rect(390, 260, 50, 200);
    image_Rainbow.fill(217, 103, 37); image_Rainbow.rect(445, 260, 50, 180);
    image_Rainbow.fill(191, 52, 52); image_Rainbow.rect(500, 260, 50, 140);
    image_Rainbow.noFill(); image_Rainbow.strokeWeight(50); 
    image_Rainbow.stroke(125, 61, 167); image_Rainbow.arc(150, 185, 150, 150, PI , PI*2);
    image_Rainbow.stroke(78, 65, 166); image_Rainbow.arc(165, 170, 230, 230, PI + HALF_PI, PI*2);
    image_Rainbow.stroke(79, 140, 94); image_Rainbow.arc(220, 160, 230, 280, PI + HALF_PI + QUARTER_PI, PI*2);
    image_Rainbow.stroke(242, 179, 61); image_Rainbow.arc(505, 160, 230, 280, PI, PI + QUARTER_PI);
    image_Rainbow.stroke(217, 103, 37); image_Rainbow.arc(560, 170, 230, 230, PI, PI + HALF_PI);
    image_Rainbow.stroke(191, 52, 52); image_Rainbow.arc(575, 185, 150, 150, PI, PI*2);    
    image_Rainbow.noFill(); image_Rainbow.stroke(random_Position_Palette[0]); image_Rainbow.strokeWeight(40); 
    image_Rainbow.arc(360, 260, 370, 200, 0, PI);
    image_Rainbow.noFill(); image_Rainbow.stroke(random_Position_Palette[1]); image_Rainbow.strokeWeight(10); 
    image_Rainbow.arc(360, 235, 480, 320, QUARTER_PI/2, PI - QUARTER_PI/2);
    image_Rainbow.stroke(random_Position_Palette[1]); 
    for (int i = 0; i <= 30; i += 10) { image_Rainbow.arc(265, 455, 100, 50 - i, PI, PI*2); }  
    for (int i = 0; i <= 30; i += 10) { image_Rainbow.arc(465, 455, 100, 50 - i, PI, PI*2); }  
    for (int i = 0; i <= 30; i += 10) { image_Rainbow.arc(360, 525, 250, 100 - i, 0, PI); }
    image_Rainbow.noStroke(); image_Rainbow.fill(random_Position_Palette[1]); 
    image_Rainbow.circle(205, 470, 15);
    image_Rainbow.circle(525, 470, 15);
  image_Rainbow.endDraw();
  image_Rainbow.save("data/image_Rainbow.PNG");
  
}

void create_UI_Elements() {
  
  //commands - creates the Unclicked Right UI Button graphic
  ui_Right_Unclicked.beginDraw();
    ui_Right_Unclicked.noStroke();
    ui_Right_Unclicked.fill(0, 168, 75);
    ui_Right_Unclicked.rect(0, 0, 240, 240, 50);    
    ui_Right_Unclicked.fill(0, 219, 99);
    ui_Right_Unclicked.rect(0, 0, 240, 180, 50);     
    ui_Right_Unclicked.fill(0, 168, 75);
    ui_Right_Unclicked.rect(20, 50, 160, 60, 10);    
    ui_Right_Unclicked.triangle(160, 25, 160, 135, 220, 85);
  ui_Right_Unclicked.endDraw();
  ui_Right_Unclicked.save("data/ui_Right_Unclicked.PNG");
  
  //commands - creates the Clicked Right UI Button graphic
  ui_Right_Clicked.beginDraw();
    ui_Right_Clicked.noStroke();
    ui_Right_Clicked.fill(0, 133, 51);
    ui_Right_Clicked.rect(0, 0, 240, 240, 50);    
    ui_Right_Clicked.fill(0, 168, 75);
    ui_Right_Clicked.rect(0, 60, 240, 180, 50);     
    ui_Right_Clicked.fill(0, 133, 51);
    ui_Right_Clicked.rect(20, 130, 160, 60, 10);    
    ui_Right_Clicked.triangle(160, 105, 160, 215, 220, 165);
  ui_Right_Clicked.endDraw();
  ui_Right_Clicked.save("data/ui_Right_Clicked.PNG");
  
  //commands - creates the Unclicked Left UI Button graphic
  ui_Left_Unclicked.beginDraw();
    ui_Left_Unclicked.noStroke();
    ui_Left_Unclicked.fill(0, 168, 75);
    ui_Left_Unclicked.rect(0, 0, 240, 240, 50);    
    ui_Left_Unclicked.fill(0, 219, 99);
    ui_Left_Unclicked.rect(0, 0, 240, 180, 50);     
    ui_Left_Unclicked.fill(0, 168, 75);
    ui_Left_Unclicked.rect(60, 50, 160, 60, 10);
    ui_Left_Unclicked.triangle(80, 25, 80, 135, 20, 85);
  ui_Left_Unclicked.endDraw();
  ui_Left_Unclicked.save("data/ui_Left_Unclicked.PNG");
  
  //commands - creates the Clicked Left UI Button graphic
  ui_Left_Clicked.beginDraw();
    ui_Left_Clicked.noStroke();    
    ui_Left_Clicked.fill(0, 133, 51);
    ui_Left_Clicked.rect(0, 0, 240, 240, 50);    
    ui_Left_Clicked.fill(0, 168, 75);
    ui_Left_Clicked.rect(0, 60, 240, 180, 50);     
    ui_Left_Clicked.fill(0, 133, 51);
    ui_Left_Clicked.rect(60, 130, 160, 60, 10);    
    ui_Left_Clicked.triangle(80, 105, 80, 215, 20, 165);
  ui_Left_Clicked.endDraw();
  ui_Left_Clicked.save("data/ui_Left_Clicked.PNG");
  
  //commands - creates the Unclicked Circle UI Button graphic
  ui_Circle_Unclicked.beginDraw();
    ui_Circle_Unclicked.noStroke();
    ui_Circle_Unclicked.fill(0, 168, 75);
    ui_Circle_Unclicked.rect(0, 0, 240, 240, 50);    
    ui_Circle_Unclicked.fill(0, 219, 99);
    ui_Circle_Unclicked.rect(0, 0, 240, 180, 50);     
    ui_Circle_Unclicked.fill(0, 168, 75);
    ui_Circle_Unclicked.circle(120, 90, 80);
  ui_Circle_Unclicked.endDraw();
  ui_Circle_Unclicked.save("data/ui_Circle_Clicked.PNG");
  
  //commands - creates the Clicked Circle UI Button graphic
  ui_Circle_Clicked.beginDraw();
    ui_Circle_Clicked.noStroke();    
    ui_Circle_Clicked.fill(0, 133, 51);
    ui_Circle_Clicked.rect(0, 0, 240, 240, 50);    
    ui_Circle_Clicked.fill(0, 168, 75);
    ui_Circle_Clicked.rect(0, 60, 240, 180, 50);     
    ui_Circle_Clicked.fill(0, 133, 51);
    ui_Circle_Clicked.circle(120, 150, 80);
  ui_Circle_Clicked.endDraw();
  ui_Circle_Clicked.save("data/ui_Circle_Unclicked.PNG");

}

void frame() {
  
  //commands - establishes frame startup settings
  noStroke();
  fill(33, 42, 89);
  blendMode(REPLACE);
  textAlign(CENTER);
  colorMode(RGB, 255);
  rectMode(CORNER);
  
  //rects - creates border
  //rect(0, 0, 190, height); //Left Side
  rect(0, 0, width, 25); //Top Side
  rect(width, height, -10, -height); //Right Side
  rect(width, height, -width, -100); //Bottom Side

  //texts - creates top texts
  fill(255); textSize(18);
  text("hamzberg", 235, 18);
  text("Processing Sketch № 15", width - 115, 18);
  text("Level: A", width/2 + 90, 18);
  
  //commands - creates bottom content boxes & title text & subtitle text
  fill(61, 79, 166);
  rect(190, height - 100, width - 200, 90, 0, 0, 7, 7);
  textSize(22); fill(255);
  text("Sticker Studio", width/2 + 90, height - 75);
  textSize(12); 
  text("Left click within canvas to place a sticker.\nScroll mouse wheel to change size.\nRight click to clear canvas.", width/2 + 90, height - 55);
  
}

void sticker_Frame(){
  
  //commands - displays the sticker frame base
  noStroke();
  fill(33, 42, 89);
  rect(0, 0, 190, height); //Left Side
  
  //commands - displays the sticker selection box
  fill(255);
  rect(10, 25, 170, 170, 10);
  rect(10, 205, 170, 50, 10);
  
  //commands - displays the unclicked UI buttons for the sticker selection
  fill(255); rect(70, 265, 50, 50, 10);
  image(UI_Elements[1], 35, 290, 50, 50);
  image(UI_Elements[3], 155, 290, 50, 50);
  
  //rect - displays first UI separator
  fill(61, 79, 166); rect(10, 325, 170, 10, 10);
  
  //commands - displays the UI for Image Scale amount 
  fill(255);
  rect(10, 345, 110, 50, 10);
  rect(130, 345, 50, 50, 10);
  fill(0); textSize(16);
  text("Image Scale", 65, 375);   

  //rect - displays second UI separator
  fill(61, 79, 166); rect(10, 405, 170, 10, 10);
  
  //commands - displays the UI for image color randomization
  fill(255);
  rect(10, 425, 110, 50, 10);
  image(UI_Elements[4], 155, 450, 50, 50);
  fill(0); textSize(16);
  text("Random", 65, 455);
  
  //rect - displays third UI separator
  fill(61, 79, 166); rect(10, 485, 170, 10, 10);
  
  //commands - displays the UI for the blendMode selection
  fill(255);
  rect(10, 505, 170, 50, 10);
  fill(0); textSize(16);
  text("Blend Mode", 95, 535);
  fill(255); rect(70, 565, 50, 50, 10);
  image(UI_Elements[1], 35, 590, 50, 50);
  image(UI_Elements[3], 155, 590, 50, 50);
  rect(10, 625, 170, 50, 10);
  
  //rect - displays final UI separator
  fill(61, 79, 166); rect(10, 685, 170, 25, 10);
  
  //commands - resets text and fill to UI standard 
  fill(0); textSize(16);
   
}
