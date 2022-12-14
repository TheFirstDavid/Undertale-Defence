//Some towers shoot bullets! If a mob is hit by a bullet,
//it does damage.

class Bullet {

  float x, y, vx, vy, d;
  int hp;

  Bullet(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 10;
    hp = 1;
  }
  
  void show() {
    stroke(black);
    strokeWeight(2);
    fill(blue);
    circle(x, y, d);
  }

  void act() {
    x = x + vx;
    y = y + vy;

    int i = 0;
    while (i < mobs.size()) {
      Mob myMob = mobs.get(i);
      if (dist(myMob.x, myMob.y, x, y) < d/2 + myMob.d/2) {
        hp--;
        myMob.hp--;
      } 
        i++;
    }
    if (x > width || x < 0 || y > height || y < 0) {
        hp--;
      }
  }
}
