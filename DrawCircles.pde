void drawCirclesLogo() {

  // calculate the fibonnacci number
  float phi = (1 + sqrt(5.0))/2.0;
  //calculate increment location
  float increment = radians(360 * phi + (360/spiral));

  // create circle objects from them
  Circle[] circles = new Circle[maxCircles];

  float xMax = 0;
  float yMax = 0;
  float xMin = 0;
  float yMin = 0;


  for (int i = 1; i < circles.length; i++) {
    float distance = sqrt(i) * expansion;
    float angle = i * increment;

    Circle circle = new Circle();
    circle.x = cos(angle) * distance;
    circle.y = sin(angle) * distance;
    circle.rad = radius;
    circles[i] = circle;

    if (circle.x > xMax) xMax = circle.x;
    if (circle.y > yMax) yMax = circle.y;
    if (circle.x < xMin) xMin = circle.x;
    if (circle.y < yMin) yMin = circle.y;
  }

  // draw all circles
  noStroke();

  for (int i = 1; i < circles.length; i++) {

    //find this spot x, y in a normalized number from 0 - 1
    float normX = (circles[i].x - xMin) / (xMax - xMin);
    float normY = (circles[i].y - yMin) / (yMax - yMin);

    // Find position inside image
    int imageX = int((img.width - 1) * normX);
    int imageY = int((img.height - 1) * normY);

    // Find the index in pixel array from x,y
    int pixelIndex = imageX + imageY * img.width;

    fill(img.pixels[pixelIndex]);
    ellipse(circles[i].x, circles[i].y, circles[i].rad*2, circles[i].rad*2);
  }
}