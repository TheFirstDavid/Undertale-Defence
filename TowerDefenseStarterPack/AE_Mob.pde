class Mob {
  float x, y, vx, vy, d;
  float hp;
  int maxhp;
  int w, h;
  int fillColor, strokeColor;
  float speed;

  Mob(float _x, float _y, float _vx, float _vy) {
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
    d = 40;
    hp = 3;
    maxhp = 3;
    fillColor = purple;
    strokeColor = black;
    speed = 1;
  }

  void show() {
    fill(fillColor);
    stroke(strokeColor);
    strokeWeight(3);
    circle(x, y, d);
  }

  void act() {
    x = x + vx*speed;
    y = y + vy*speed;
    int i = 0;
    while (i < nodes.length) {
      if (dist(nodes[i].x, nodes[i].y, x, y) < speed) {
        vx = nodes[i].dx;
        vy = nodes[i].dy;
      }
      i++;
    }

    i = 0;
    while (i < bullets.size()) {
      Bullet myBullet = bullets.get(i);
      if (dist(myBullet.x, myBullet.y, x, y) < d/2 + myBullet.d/2) {
        hp--;
      }
      i++;
    }
    if (y > height+100) {
      hp = hp - 100;
      lives--;
    }
  }
  
  void healthbar() {
    rectMode(CORNER);
    noStroke();
    fill(black);
    rect(x-27, y-(d+10)-2, 54, 24);
    fill(white);
    rect(x-25, y-(d+10), 50, 20);
    fill(pink);
    rect(x-25, y-(d+10), hp*50/maxhp, 20);
    rectMode(CENTER);
  }
}
