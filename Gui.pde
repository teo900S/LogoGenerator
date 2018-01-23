void gui() {
  cp5 = new ControlP5(this);

  //Group 1,
  Group g1 = cp5.addGroup("myGroup1")
    .setBackgroundColor(color(90, 154))
    .setBackgroundHeight(300)
    ;

  cp5.addBang("pdf") //Export PDF
    .setPosition(20, 20)
    .setSize(38, 38)
    .moveTo(g1)
    .plugTo(this, "exportPdf")
    ;

  cp5.addBang("File " + "Input") //File Input
    .setPosition(70, 20)
    .setSize(38, 38)
    .moveTo(g1)
    .plugTo(this, "loadImg")
    ;

  cp5.addSlider("background") //Background Slider
    .setPosition(20, 90)
    .setSize(100, 30)
    .setRange(0, 250)
    .setValue(127)
    .moveTo(g1)
    ;

  cp5.addSlider("spiral") //Change Spiral
    .setPosition(20, 130)
    .setSize(100, 30)
    .setRange(0, 5)
    .setValue(1.0)
    .moveTo(g1)
    ;

  cp5.addSlider("expansion") //Spiral Expansion
    .setPosition(20, 170)
    .setSize(100, 30)
    .setRange(0, 30)
    .setValue(15.0)
    .moveTo(g1)
    ;

  cp5.addSlider("radius") // Circle Radius
    .setPosition(20, 210)
    .setSize(100, 30)
    .setRange(0, 30)
    .setValue(10.0)
    .moveTo(g1)
    ;

  cp5.addSlider("maxCircles") // Number of Circles
    .setPosition(20, 250)
    .setSize(100, 30)
    .setRange(0, 2400)
    .setValue(300.0)
    .moveTo(g1)
    ;
    
  cp5.addTextarea("txt") // Display text input description
    .setPosition(40, 720)
    .setSize(270, 45)
    .setFont(createFont("Arial", 12))
    .setLineHeight(14)
    .setColor(color(255))
    .setColorBackground(color(40, 154))
    .setColorForeground(color(255,100))
    .setText("Limit input image to a range of 500 x 500 pixels"
            + "  to avoid source image overlap with drawing");
    ;


  accordion = cp5.addAccordion("acc") // Accordion
    .setPosition(40, 40)
    .setWidth(200)
    .addItem(g1)
    ;


  accordion.open(0, 1, 2);
  accordion.setCollapseMode(Accordion.MULTI);
}