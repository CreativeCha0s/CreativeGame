class Obstacles {
Player player;
  float oX, oY, oW, oH;
  boolean moving, hit;

  Obstacles(float x, float y, float w, float h) {
    this.oX = x;
    this.oY = y;
    this.oW = w;
    this.oH = h;

    hit = false;
  }
  void display() {
    fill(0, 0, 0);
    rectMode(CENTER);
    stroke(1);
    rect(oX, oY, oW, oH);
  }

   
  boolean isHitBy(Player p) {
    float left = x - oW/2;
    float right = x + oW/2;
    float top = y - oH/2;
    float bottom = y + oH /2;

    return p.x > left && p.x < right && p.y > top && p.y < bottom;
  }
}
