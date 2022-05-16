PImage eyeDropper1, stamp, addImage, red, green, yellow, purple, brush, transparency,picture, save, clear, flower;
String overED ="off", overST = "off", overLI = "off",overRD = "off", overGR = "off", overYL = "off", overPL = "off", overSV = "off", overCL ="off";
int EDX, EDY; //position of eyedropper
HScrollbar hs1, hs2;
color[] colours = new color[4];
int c = 0;
boolean loadImage = false;
  color d;
void setup(){
  
 size (600,800);
 background(255, 255, 255);
  colours[0] = color(255, 0, 0);
  colours[1] = color(0, 255, 0);
  colours[2] = color(255, 255, 0);
  colours[3] = color(50, 0, 50);
 eyeDropper1 = loadImage("eyedropper.jpg");
 stamp = loadImage("stamp.png");
 addImage = loadImage("add-image.png");
 red = loadImage("red.png");
 green = loadImage("green.png");
 yellow = loadImage("yellow.png");
 purple = loadImage("purple.png");
 brush = loadImage("brush.png");
 transparency = loadImage("transparency.png");
 picture = loadImage("picture.jpeg");
 save = loadImage("save.png");
 clear = loadImage ("clear.png");
 flower = loadImage("flower.png");
hs1 = new HScrollbar(100, 25, 100, 16, 16);
hs2 = new HScrollbar(250, 25,100, 16, 16);

}

void draw(){

image( eyeDropper1,25,25,50,50);
image(stamp, 25,80,50,50);
image(addImage, 25,140,50,50);
image(red, 25,200,25,25);
image(green, 50,200,25,25);
image(yellow, 25,225,25,25);
image(purple, 50,225,25,25);
image(brush, 210, 10, 25, 25);
image(transparency, 360, 10, 25, 25);
image(save, 25, 260, 50,50);
image(clear, 25, 320,50,50);
if(loadImage){
image(picture, 300, 200, 200,100);}
if(overED =="on"){

  color d = get(mouseX, mouseY);
fill(d);
rect(25, 380, 50, 50);
}


 hs1.display();
 hs2.display();
 hs2.upDate();
   hs1.upDate();
}


void mousePressed(){
  int x  = mouseX;
  int y  = mouseY;
  
if(x>25 && x<75 && y>25 && y<75){
overED= "on";
overST = "off";
overLI = "off";
overRD = "off";
overGR = "off";
overYL = "off";
overPL = "off";
overSV = "off";
overCL = "off";
}else if(x>25 && x<75 && y>75 && y<125){
overED = "off";
overST = "on";
overLI = "off";
overRD = "off";
overGR = "off";
overYL = "off";
overPL = "off";
overSV = "off";
overCL = "off";
}
else if(x>25 && x<75 && y>125 && y<175){
overED = "off";
overST = "off";
overLI = "on";
overRD = "off";
overGR = "off";
overYL = "off";
overPL = "off";
overSV = "off";
overCL = "off";
}
else if(x>25 && x<50 && y>200 && y<225){
overED ="off";
overST = "off";
overLI = "off";
overRD = "on";
overGR = "off";
overYL = "off";
overPL = "off";
overSV = "off";
overCL = "off";
}
else if(x>50 && x<75 && y >200 && y<225){
overED ="off";
overST = "off";
overLI = "off";
overRD = "off";
overGR = "on";
overYL = "off";
overPL = "off";
overSV = "off";
overCL = "off";
}
else if(x>25 && x<50 && y >225 && y<250){
overED ="off";
overST = "off";
overLI = "off";
overRD = "off";
overGR = "off";
overYL = "on";
overPL = "off";
overSV = "off";
overCL = "off";
}
else if(x>50 && x<75 && y >225 && y<250){
overED ="off";
overST = "off";
overLI = "off";
overRD = "off";
overGR = "off";
overYL = "off";
overPL = "on";
overSV = "off";
overCL = "off";
}
else if(x>25 && x<75 && y >260 && y<310){
overED ="off";
overST = "off";
overLI = "off";
overRD = "off";
overGR = "off";
overYL = "off";
overPL = "off";
overSV = "on";
overCL = "off";
}else if(x>25 && x<75 && y>320 && y<370){
overED ="off";
overST = "off";
overLI = "off";
overRD = "off";
overGR = "off";
overYL = "off";
overPL = "off";
overSV = "off";
overCL = "on";
background(255,255,255);
if(loadImage == true)
loadImage = !loadImage;
}

  
 if(overST == "on"){
image(flower, mouseX,mouseY, 50,50);

}
  
  
  
  
  
switch(overSV){
 case "on" :
 save("canvas.jpg");
 break; 
}

switch(overLI){
case "on" :
loadImage = !loadImage;
break;
}

}

void mouseDragged(){
  
  if(overRD =="on"){
  c=0;
  }else if(overGR == "on"){
  c=1;
  }else if(overYL == "on"){
  c=2;
  }else if(overPL == "on"){
  c=3;
  }
    line(mouseX, mouseY, pmouseX, pmouseY);
  float strokePos = hs1.getPos()-100;
  strokeWeight( strokePos);
  
  float strokeAlp = hs2.getPos() -290  ;
    stroke(colours[c],strokeAlp);

}

//

class HScrollbar {
  int swidth, sheight;    // width and height of bar
  float xpos, ypos;       // x and y position of bar
  float spos, newspos;    // x position of slider
  float sposMin, sposMax; // max and min values of slider
  int loose;              // how loose/heavy
  boolean over;           // is the mouse over the slider?
  boolean locked;
  float ratio;

  HScrollbar (float xp, float yp, int sw, int sh, int l) {
    swidth = sw;
    sheight = sh;
    int widthtoheight = sw - sh;
    ratio = (float)sw / (float)widthtoheight;
    xpos = xp;
    ypos = yp-sheight/2;
    spos = xpos + swidth/2 - sheight/2;
    newspos = spos;
    sposMin = xpos;
    sposMax = xpos + swidth - sheight;
    loose = l;
  }
  void upDate() {
    if (overEvent()) {
      over = true;
    } else {
      over = false;
    }
    if (mousePressed && over) {
      locked = true;
    }
    if (!mousePressed) {
      locked = false;
    }
    if (locked) {
      newspos = constrain(mouseX-sheight/2, sposMin, sposMax);
    }
    if (abs(newspos - spos) > 1) {
      spos = spos + (newspos-spos)/loose;
    }
  }

  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  boolean overEvent() {
    if (mouseX > xpos && mouseX < xpos+swidth &&
       mouseY > ypos && mouseY < ypos+sheight) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    noStroke();
    fill(204);
    rect(xpos, ypos, swidth, sheight);
    if (over || locked) {
      fill(0, 0, 0);
    } else {
      fill(102, 102, 102);
    }
    rect(spos, ypos, sheight, sheight);
  }

  float getPos() {
    // Convert spos to be values between
    // 0 and the total width of the scrollbar
    return spos * ratio;
  }
}
