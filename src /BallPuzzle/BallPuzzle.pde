Player player;
Goal[] goal;

float x, y, speed, enemyCount = 0, lvlComplete;
float anchorX = 350, anchorY = 600;
boolean drag = false;
int score, level;
char screen = 'S';

Button btnPlay, btnLvl1, btnNextLvl;

void setup() {
  size(1600, 900);
  pixelDensity(1);
  frameRate(90);
  strokeWeight(2);
  stroke(255, 100);

  level = 0;
  lvlComplete = 0;

  player = new Player(anchorX, anchorY, 30);

  goal = new Goal[1];
  goal[0] = new Goal(600, 200, 60, 60);


  btnPlay = new Button("Play", 800, 400, 400, 100, #ff9538, #ffd1a8, 150);
  btnLvl1 = new Button("Level 1", 800, 400, 400, 100, #ff9538, #ffd1a8, 150);
  btnNextLvl = new Button("Next Level", 800, 400, 400, 100, #ff9538, #ffd1a8, 150);
}

void draw() {
  switch(screen) {
  case 'S':
    startScreen();
    break;

  case 'P':
    levelScreen();
    break;

  case 'G':
    gameScreen();
    break;

  case 'L':
    pauseScreen();
    break;
  }
}

void startScreen() {
  background(255);
  textAlign(CENTER, CENTER);
  textSize(150);
  fill(0);
  text("Ball Puzzle", 800, 100);
  btnPlay.display();
}

void levelScreen() {
  background(255);
  textAlign(CENTER, CENTER);
  textSize(100);
  fill(0);
  text("Pick Level", 800, 200);
  btnLvl1.display();
}

void gameScreen() {
  background(255);

  fill(80);
  ellipse(anchorX, anchorY, 12, 12);

  textSize(75);
  textAlign(LEFT, CENTER);
  fill(0);
  text("Level: " + level, 50, 50);

  player.update();
  player.display();
  player.drag();

  for (int i = 0; i < goal.length; i++) {
    goal[i].display();

    if (!goal[i].hit && player.moving) {
      if (goal[i].isHitBy(player)) {
        goal[i].hit = true;
        lvlComplete = 1;
      }
    }
  }

  if (lvlComplete == 1) {
    screen = 'L';
    player.moving = false;
  }
}

void pauseScreen() {
  background(255);
  textSize(200);
  textAlign(CENTER, CENTER);
  fill(0);
  text("Level Complete!", 800, 300);
  btnNextLvl.display();
}

void mousePressed() {
  switch(screen) {
  case 'S':
    if (btnPlay.clicked()) {
      screen = 'P';
    }
    break;

  case 'P':
    if (btnLvl1.clicked()) {
      level = 1;
      screen = 'G';
    }
    break;

  case 'G':
    if (!player.moving && player.mouseOn(mouseX, mouseY)) {
      drag = true;
    }
    break;

  case 'L':
    if (btnNextLvl.clicked()) {
      screen = 'G';
      resetGame();
      if (level == 1) {
        level = 2;
      } else if (level == 2) {
        level = 3;
      } else if (level == 3) {
        screen = 'S';
      }
      break;
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

void keyPressed() {
  if (key == 'r' || key == 'R') {
    resetPlayer();
  }
}

void resetPlayer() {
  player.x = anchorX;
  player.y = anchorY;
  player.xSpeed = 0;
  player.ySpeed = 0;
  player.moving = false;
  player.launched = false;
}
void resetGame() {
  resetPlayer();
  lvlComplete = 0;
}
