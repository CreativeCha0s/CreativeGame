Player player;
EnemyAndStructure[] enemy;
float x, y, speed, enemyCount = 0;
float anchorX = 350, anchorY = 600;
boolean drag = false;
PVector position, velocity, gravity;
int score;
char screen = 'S';

Button btnPlay;



void setup() {
  size(1600, 900);
  pixelDensity(1);
  frameRate(90);
  strokeWeight(2);
  stroke(255, 100);
  position = new PVector(350, 600);
  velocity = new PVector(0, 0);
  gravity = new PVector(0, 0.5);
  player = new Player(anchorX, anchorY, 30);

  
  enemy = new EnemyAndStructure[3];
  enemy[0] = new EnemyAndStructure(600, 200, 60, 60);
  enemy[1] = new EnemyAndStructure(700, 320, 60, 60);
  enemy[2] = new EnemyAndStructure(650, 420, 60, 60);

  btnPlay = new Button("Play", 800, 400, 400, 100, #ff9538, #ffd1a8, 150);
}

void draw() {

  switch(screen) {
  case 'S':
    startScreen();
    break;
  case 'G':
    gameScreen();
    break;
  case 'C':
    clearScreen();
    break;
  }
}

void startScreen() {
  textAlign(CENTER, CENTER);
  textMode(CENTER);
  textSize(150);
  text("Angy Birbs", 800, 100);
  btnPlay.display();
}

void gameScreen() {
  background(255);
  fill(80);
  ellipse(anchorX, anchorY, 12, 12);
  imageMode(CENTER);
  textSize(75);
  textAlign(LEFT, CENTER);
  text("Score: " + score, 50, 50);
  enemyCount = 0;
  
  player.update();
  player.display();
  player.drag();
  velocity.add(gravity);
  position.add(velocity);


  for (int i = 0; i < enemy.length; i++) {
    enemy[i].display();

    if (!enemy[i].hit && player.moving) {
      if (enemy[i].isHitBy(player)) {
        enemy[i].hit = true;
        enemyCount = enemyCount + 1;
        score += 10;
      }
    }
  }
  if(enemyCount == 3) {
    screen = 'C';
  }
}

void clearScreen() {
  textSize(200);
  textAlign(CENTER, CENTER);
  text("Level Complete!", 800, 300);
}


void mousePressed() {
  switch(screen) {
  case 'S':
  if (btnPlay.clicked()) {
  screen = 'G';
  
  }
  case 'G':
    
      if (!player.moving && player.mouseOn(mouseX, mouseY)) {
        drag = true;
      }
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
