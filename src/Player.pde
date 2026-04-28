class Player {
  float x, y, z, xSpeed, ySpeed, size, xDir, yDir;
  boolean moving, launched;
  PImage player;


  Player(float startX, float startY, float s) {
    x = startX;
    y = startY;
    xSpeed = 0;
    ySpeed = 0;
    size = s;
    xDir = 1;
    yDir = 1;
    moving = false;
  }
  void update() {
    //if (moving) {
    x += xSpeed * xDir;
    y += ySpeed * yDir;
  }
  void display() {
    player = loadImage("testCharacter.png");
    image(player, x, y, 100, 100);
  }

  void launch(float anchorX, float anchorY, float releaseX, float releaseY) {
    float dx = anchorX - releaseX;
    float dy = anchorY - releaseY;



    //x = anchorX;
    //y = anchorY;

    xSpeed = dx * 0.06 * xDir;
    ySpeed = dy * 0.06 * yDir;

    if (x > width) {
      xDir *= -1;
    }
    if (y > height) {
      yDir *= -1;
    }

    moving = true;
    launched = true;
  }




  boolean mouseOn(float mx, float my) {
    float d = dist(mx, my, x, y);
    return d < size;
  }




  void drag() {
    if (drag) {
      imageMode(CENTER);
      stroke(255, 0, 0);
      strokeWeight(5);
      line(325, 600, mouseX, mouseY);
      line(375, 600, mouseX, mouseY);
    }
  }
}
