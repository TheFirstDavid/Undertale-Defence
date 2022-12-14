void gameOver() {
  background(black);
  textFont(holder);
  textSize(50);
  text("Awh, too bad! Try again?", width/2, height/3);
  again.show();
  gameoverClicks();
}

void gameoverClicks() {
  if (again.clicked){
    mode = INTRO;
    lives = 3;
    t = 0;
    m = 0;
    
    int i = 0;
    while(i < mobs.size()) {
      mobs.remove(i);
      i++;
    }
    
    i = 0;
    while(i < towers.size()) {
      towers.remove(i);
      i++;
    }
    
    i = 0;
    while(i < bullets.size()) {
      bullets.remove(i);
      i++;
    }
    map1checker = false;
    map2checker = false;
  }
}
