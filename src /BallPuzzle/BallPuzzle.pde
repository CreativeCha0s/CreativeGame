Player player;
Goal[] goal;



float x, y, speed, enemyCount = 0, lvlComplete;
float anchorX = 350, anchorY = 600;
boolean drag = false;
int score, level;
char screen = 'S';

Button btnPlay, btnLvl1;



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

  }
  println(screen);
}

void startScreen() {
  textAlign(CENTER, CENTER);
  textMode(CENTER);
  textSize(150);
  text("Angy Birbs", 800, 100);
  btnPlay.display();
}

void levelScreen() {
  background(255);
  textAlign(CENTER, CENTER);
  textMode(CENTER);
  textSize(100);
  text("Pick Level", 800, 300);
  btnLvl1.display();
}
void gameScreen() {

  background(255);
  fill(80);
  ellipse(anchorX, anchorY, 12, 12);
  imageMode(CENTER);
  textSize(75);
  textAlign(LEFT, CENTER);
  text("Level: " + level, 50, 50);




  player.update();
  player.display();
  player.drag();

  // levels.identifyLevels();


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
        player.moving = false;
        textSize(200);
        textAlign(CENTER, CENTER);
        text("Level Complete!", 800, 300);
   }
}





void mousePressed() {
  switch(screen) {
  case 'S':
    if (btnPlay.clicked()) {
      screen = 'P';
      level = 1;
      break;
    }


  case 'P':
    if (btnLvl1.clicked()) {
      level = 1;
      screen = 'G';
      break;
    }


  case 'G':

    if (!player.moving && player.mouseOn(mouseX, mouseY)) {
      drag = true;
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
