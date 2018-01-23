import controlP5.*;
import processing.pdf.*;

ControlP5 cp5;
Accordion accordion;

boolean record;

//Variables
int maxCircles = 300; // radious of circles
float radius = 10; //radius of circles
float expansion = 15; // distance between circles
float spiral; //Control spiral frequency

PImage img;

void setup() {

  size(1280, 800);
  smooth(5);
  img = loadImage("img.jpg");
  img.loadPixels();

  gui();
}

void draw() {
  smooth();
  float back1 = cp5.getController("background").getValue();
  background(back1);

  // Controllers
  float spiral = cp5.getController("spiral").getValue(); //Spiral
  float expansion = cp5.getController("expansion").getValue(); //Expansion
  float radius = cp5.getController("radius").getValue();  //radius
  float getCircles = cp5.getController("maxCircles").getValue(); //MaxCircles

  // Locate source image
  float scaleFactor = 0.4;
  image(img, 200, (height / 2) - ((img.height * scaleFactor) / 2), img.width * scaleFactor, img.height * scaleFactor);

  //PDF record
  if (record) {
    beginRecord(PDF, "LogoGenerator-####.pdf");
  }
  pushMatrix();
  translate((width / 2) + 170, height / 2);
  drawCirclesLogo();

  println(record);

  popMatrix();
  if (record) {
    endRecord();
    record = false;
  }
}

//export pdf
void exportPdf() {
  if (mousePressed == true ) {
    record = true;
  } else {
    record = false;
  }
}

//Load image
void loadImg() {
  if ( mousePressed == true ) {
    selectInput("Choose an image", "inputFile");
  }
}
//File Input 
void inputFile(File selected) {
  if (selected == null) exit();
  img = loadImage(selected.getAbsolutePath());
  loop();
}