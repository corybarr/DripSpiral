int maxGrowth;
int curGrowth;
float crawlRateY;
float crawlRateX;
float scaleGrowthRate = 0.05;
boolean cycleColor = true;
boolean ellipseCrawl = true;
int curX;
int curY;
float curRotation;
float curGreenVal;
float curBlueVal;
boolean randomizeStroke = false;
int curEllipseXSize;
int curEllipseYSize;

void setup() {
  size(500, 500);
  curRotation = 0;
  crawlRateY = 5;
  crawlRateX = 0;
  curGreenVal = 0.0f;
  curBlueVal = 0.0f;
  curEllipseXSize = 100;
  curEllipseYSize = 50;

  maxGrowth = 50;
  curGrowth = 0;
  curX = width / 2;
  curY = 10;
  
  smooth();
  noStroke();
  frameRate(15);
  background(0);
}

void draw() {

  if (cycleColor) {
    float red_val = map(curGrowth, 0, maxGrowth, 0, 255);
    float blue_val = abs(sin(frameCount * 0.002)) * 255.0f;
    float green_val = abs(sin(frameCount * 0.00021)) * 255.0f;
    fill(red_val, green_val, blue_val);
  }
  
  if (curGrowth < maxGrowth) {
    ellipseGrow();
    if (ellipseCrawl) {
      coordCrawl();
    }
    curGrowth++;
    curRotation += 0.10;
  }
  
}

void ellipseGrow() {
  pushMatrix();
  translate(curX, curY);
  rotate(curRotation);
  float scaleFactor = curGrowth * scaleGrowthRate;
  scale(scaleFactor);
  ellipse(0, 0, curEllipseXSize, curEllipseYSize);
  popMatrix();
}

void coordCrawl() {
   curX += crawlRateX;
   curY += crawlRateY;
}

void mousePressed() {
  curX = mouseX;
  curY = mouseY;
  curGrowth = 0;
  crawlRateY = random(1, 6);
  crawlRateX = random(-6, 6);
  
    if (randomizeStroke) {
    int rand_val = floor(random(0, 2));
    if (rand_val == 1) {
      stroke(0);
    }
    else {
      noStroke();
    }
  }

  curEllipseXSize = floor(random(30, 100));
  curEllipseYSize = floor(random(20, 80));
}
