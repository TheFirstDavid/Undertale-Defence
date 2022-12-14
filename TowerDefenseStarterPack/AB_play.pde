boolean enemy = false;
int i = 0;
int t = 0;
int m = 0;
int lives = 3;
int money = 4000;

void play() {
  if(maps1.clicked) map1();
  if(maps2.clicked) map2();
}

void map1() {
  drawMap();
  animateThings();
  handleButtonClicks();
  buttonSpace();
  texts();
}

void map2() {
  drawMap2();
  animateThings();
  handleButtonClicks();
  buttonSpace();
  texts();
}

void buttonSpace() {
  //Button Area
  stroke(lbrown);
  strokeWeight(10);
  fill(brown);
  rect(850, 400, 300, 800);

  //Button
  textFont(holderme);
  wave.show();
  build.show();
}

void animateThings() {
  int i = 0;
  while (i < mobs.size()) {
    Mob myMob = mobs.get(i);
    myMob.act();
    myMob.show();
    myMob.healthbar();

    //Mobs dying
    if (myMob.hp <= 0) {
      mobs.remove(i);
      money = money + 60;
    } else {
      i++;
    }
  }


//Gunner and Bullet
  i = 0;
  while (i < towers.size()) {
    Tower myTower = towers.get(i);
    myTower.act();
    myTower.show();
    i++;
  }

  i = 0;
  while (i < bullets.size()) {
    Bullet myBullet = bullets.get(i);
    myBullet.show();
    myBullet.act();

    //Bullets dying
    if (myBullet.hp <= 0) {
      bullets.remove(i);
    } else {
      i++;
    }
  }
}

void handleButtonClicks() {
  if (build.clicked) {
      mode = BUILD;
    }
  if (mobs.size() == 0) {
    enemy = false;
    i = 0;
    if (wave.clicked) {
      enemy = true;
      m++;
      t++;
    }
    
    while (enemy == true  && i < m) {
      mobs.add(new Mob(-40 - 50*i, 350, 2, 0));
      i++;
    }
    
    if(wave.clicked && t % 3 == 0) {
      i = 0;
      while(i < t/3) {
        mobs.add(new Chonk(-40 - 50*i, 350, 2, 0));
        i++;
      }
    }
    
    if(wave.clicked && t % 5 == 0) {
      i = 0;
      while(i < t/5) {
        mobs.add(new ishowspeed(-40 - 50*i, 350, 2, 0));
        i++;
      }
    }
    
  }
}

void texts() {
    //Wave Text
  fill(white);
  textFont(holderth);
  textSize(40);
  text("Wave:", 100, 50);
  textFont(number);
  textSize(50);
  text(t, 200, 50);
  
  //Lives Text
  textFont(holderme);
  textSize(40);
  fill(255, 0, 0);
  text("Lives: ", 550, 50);
  textFont(number);
  textSize(50);
  text(lives, 650, 50);
  if (lives == 0) {
    mode = GAMEOVER;
  }
  
  //Money Text
  textFont(holderth);
  textSize(30);
  fill(black);
  text("$ ", 850, 50);
  textFont(number);
  textSize(40);
  text(money, 890, 45);
}

void drawMap() {
  background(green);
  stroke(road);
  strokeWeight(50);
  line(0, 350, 500, 350);
  line(500, 350, 500, 150);
  line(500, 150, 300, 150);
  line(300, 150, 300, 650);
  line(300, 650, 100, 650);
  line(100, 650, 100, 500);
  line(100, 500, 650, 500);
  line(650, 500, 650, 650);
  line(650, 650, 500, 650);
  line(500, 650, 500, 825);
}

void drawMap2() {
  image(map2back, width/2, height/2, 1200, 800);
  stroke(blue);
  strokeWeight(50);
  line(0, 350, 300, 350);
  line(300, 350, 300, 50);
  line(300, 50, 450, 50);
  line(450, 50, 450, 450);
  line(450, 450, 600, 450);
  line(600, 450, 600, 600);
  line(600, 600, 150, 600);
  line(150, 600, 150, 700);
  line(150, 700, 500, 700);
  line(500, 700, 500, 825);
}
