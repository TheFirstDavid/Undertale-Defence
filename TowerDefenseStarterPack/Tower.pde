boolean buy = false;
class Tower {
  final int PLACING = 0;
  final int PLACED = 1;

  float x, y;
  int cooldown, threshold;
  int mode, gunType;

  Tower(float _x, float _y, int c, int th, int _gunType) {
    x = _x;
    y = _y;
    cooldown = c;
    threshold = th;
    mode  = PLACING;
    gunType = _gunType;
  }

  void show() {
    if (gunType == gun) {
      showGunner();
    } else if (gunType == AOE) {
      showAOE();
    } else if (gunType == sniper) {
      showSniper();
    }
  }


  void act() {
      if (gunType == gun) {
      shootGunner();
    } else if (gunType == AOE) {
      shootAOE();
    } else if (gunType == sniper) {
      shootSniper();
    }
  }

  void showGunner() {
    stroke(black);
    strokeWeight(4);
    fill(blue);
    if (mode == PLACED) {
      buy = false;
      square(x, y, 40);
      
    } else if (mode == PLACING) {
      buy = true;
      square(mouseX, mouseY, 50);
      if (mousePressed && mouseX > 0 && mouseX < 700) {
        mode = PLACED;
        x  = mouseX;
        y = mouseY;
      }
    }
  }
  
  void shootGunner() {
    cooldown++;
    if (cooldown >= threshold && mobs.size() > 0) {
      cooldown = 0;
      bullets.add(new Bullet(x, y, 0, -10)); //UP
      bullets.add(new Bullet(x, y, 0, 10)); //DOWN
      bullets.add(new Bullet(x, y, -10, 0)); //LEFT
      bullets.add(new Bullet(x, y, 10, 0)); //RIGHT
    }
  }

  void showAOE() {
    stroke(black);
    strokeWeight(4);
    fill(yellow);
    if (mode == PLACED) {
      buy = false;
      circle(x, y, 40);
    } else if (mode == PLACING) {
      buy = true;
      circle(mouseX, mouseY, 50);
      if (mousePressed && mouseX > 0 && mouseX < 700) {
        mode = PLACED;
        x = mouseX;
        y = mouseY;
      }
    }
  }
  
  void shootAOE() {
    cooldown++;
    if (cooldown < threshold && mobs.size() > 0) {
    ringShoot.x = x;
    ringShoot.y = y;
    ringShoot.act();
    ringShoot.show();
    }
    if (cooldown > 60) {
      cooldown = 0;
    }
  }

void showSniper() {
    stroke(black);
    strokeWeight(4);
    fill(white);
    if (mode == PLACED) {
      buy = false;
      triangle(x-20, y-20, x, y + 20, x + 20, y - 20);
    } else if (mode == PLACING) {
      buy = true;
      triangle(mouseX-30, mouseY-30, mouseX, mouseY + 30, mouseX + 30, mouseY - 30);
      if (mousePressed && mouseX > 0 && mouseX < 700) {
        mode = PLACED;
        x = mouseX;
        y = mouseY;
      }
    }
 }
 
 void shootSniper() {
   cooldown++;
   if (cooldown > threshold && mobs.size() > 0) {
     stroke(blue);
     strokeWeight(10);
     line(mobs.get(0).x, mobs.get(0).y, x, y);
    cooldown = int(random(-10, 10));
    mobs.remove(0);
    money = money + 60;
   }
 }
 
 void showLazer() {
   stroke(black);
   strokeWeight(4);
   fill(purple);
   if(mode == PLACED) {
    triangle(x, y-10, x-10, y+70, x+50, y); 
   } else if (mode == PLACING) {
     buy = true;
     triangle(mouseX-30, mouseY-30, mouseX, mouseY + 30, mouseX + 30, mouseY -30);
     if(mousePressed && mouseX > 0 && mouseX < 700) {
       mode = PLACED;
       x = mouseX;
       y = mouseY;
     }
   }
 }
 
 void shootLazer() {
   cooldown++;
   if(cooldown >= threshold && mobs.size() > 0) {
     Mob myMob = mobs.get(0);
     myMob.hp = myMob.hp - 0.05;
     stroke(purple);
     strokeWeight(7);
     line(myMob.x, myMob.y, x+10, y+10);
   }
   if (cooldown > 80) {
     cooldown = 0;
    }
   }
}
