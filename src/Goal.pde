class Goal {

  float x, y, w, h;
  boolean hit;


  Goal(float xPos, float yPos, float width, float height) {
    x = xPos;
    y = yPos;
    w = width;
    h = height;
    hit = false;
  }

  void display() {
    if (hit) {
      fill(100, 200, 100);
    } else {
      fill(100, 150, 255);
    }
    rectMode(CENTER);
    stroke(0);
    rect(x, y, w, h);
  }
  
  boolean isHitBy(Player p) {
    float left = x - w/2;
    float right = x + w/2;
    float top = y - h/2;
    float bottom = y + h /2;

    return p.x > left && p.x < right && p.y > top && p.y < bottom;
  }
}
