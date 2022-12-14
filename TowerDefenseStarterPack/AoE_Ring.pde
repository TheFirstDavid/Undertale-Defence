//Some classes place AoE rings on the map. The AoE ring
//hurts all mobs in the ring. The ring only lasts for a
//short period of time.

class Ring {
  float x, y;

  Ring(float _x, float _y) {
    y = _y;
    x = _x;
  }

  void show() {
    stroke(black);
    strokeWeight(2);
    fill(white);
    circle(x, y, 150);
  }

  void act() {
    int i = 0;
    while (i < mobs.size()) {
      Mob myMob = mobs.get(i); 
      if (dist(myMob.x, myMob.y, x, y) < 100 + myMob.d/2) {
        myMob.hp--;
      }
      i++;
    }
  }
}
