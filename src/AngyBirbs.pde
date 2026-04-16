Player player;
float x, y, speed;
float anchorX = 350, anchorY = 600;
boolean drag = false;


void setup() {
  size(1600, 900);
  pixelDensity(1);
  frameRate(90);
  strokeWeight(2);
  stroke(255, 100);

  player = new Player(anchorX, anchorY, 30);
}

void draw() {
  background(255);
  fill(80);
  ellipse(anchorX, anchorY, 12, 12);
  imageMode(CENTER);
  


  player.update();
  player.display();
  player.drag();
}


void mousePressed() {
  if (!player.moving && player.mouseOn(mouseX, mouseY)) {
    drag = true;
  }
}
void mouseDragged() {
  if (drag) {
    player.x = mouseX;
    player.y = mouseY;
  }
}
void mouseReleased() {
  if (drag) {
    player.launch(anchorX, anchorY, mouseX, mouseY);
    drag = false;
  }
}
