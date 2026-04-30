class Player {
  float x, y, xSpeed, ySpeed, size;
  boolean moving, launched;
  PImage player;

  Player(float startX, float startY, float s) {
    x = startX;
    y = startY;
    xSpeed = 0;
    ySpeed = 0;
    size = s;
    moving = false;
    launched = false;
    player = loadImage("testCharacter.png");
  }

  void display() {
    imageMode(CENTER);
    image(player, x, y, 100, 100);
  }

  void update() {
    if (moving) {
      x += xSpeed;
      y += ySpeed;

      float r = 25;

      if (x <= r) {
        x = r;
        xSpeed *= -1;
      }

      if (x >= width - r) {
        x = width - r;
        xSpeed *= -1;
      }

        if (y <= r) {
          y = r;
          ySpeed *= -1;
        }

        if (y >= height - r) {
          y = height - r;
          ySpeed *= -1;
        }
      }
    }
  

  void launch(float anchorX, float anchorY, float releaseX, float releaseY) {
    float dx = anchorX - releaseX;
    float dy = anchorY - releaseY;

    xSpeed = dx * 0.06;
    ySpeed = dy * 0.06;

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
  boolean intersect(Obstacle o) {
    float d = dist(x, y, o.oX, o.oX);
    if (d < 100) {
      return true;
    } else {
      return false;
    }    

  }
}

