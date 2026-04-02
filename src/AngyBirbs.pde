PImage player;

float playerX, playerY;
float easing = 0.05;
int inBounds;

void setup() {
  size(1600, 900);
  pixelDensity(1);
  frameRate(90);
  strokeWeight(2);
  stroke(255, 100);


  //image setup
  player = loadImage("testCharacter.png");
  imageMode(CENTER);
}

void draw() {
  background(255);

  float areaX = 100;
  float areaY = 400;
  float areaW = 250;
  float areaH = 400;
  
  if(inBounds == 1) {
  noFill();
  stroke(200);
  strokeWeight(2);
  rect(areaX, areaY, areaW, areaH);
  } else {
    noFill();
  stroke(200);
  strokeWeight(2);
  rect(areaX, areaY, areaW, areaH);
  }

  if (mouseX > areaX && mouseX < areaX + areaW && mouseY > areaY && mouseY < areaY + areaH) {
    inBounds = 1;
    imageMode(CENTER);
    stroke(255, 0, 0);
    strokeWeight(5);
    line(325, 600, mouseX, mouseY);
    image(player, mouseX+35, mouseY-10);
    line(375, 600, mouseX, mouseY);
  } else {
    inBounds = 0;
    fill(150);
    image(player, 350, 600);
  }
}
