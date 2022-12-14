void build() {
  if (maps1.clicked) drawMap();
  if(maps2.clicked) drawMap2();
  handlebuildClicks();
  animateThings();
  buildbuttonSpace();
  buildText();
  texts();
}

void handlebuildClicks() {
  if (build.clicked) {
    mode = PLAY;
  }


  if (gunner.clicked && money >= 330 && buy == false) {
    towers.add(new Tower(mouseX, mouseY, 0, 60, gun));
    boxes.add(new Hitbox(mouseX, mouseY));
    money = money -330;
  }


  if (shotgun.clicked && money >= 500) {
    towers.add(new Tower(mouseX, mouseY, 0, 3, AOE));
    boxes.add(new Hitbox(mouseX, mouseY));
    money = money - 500;
  }


    if (snipers.clicked && money >= 700) {
      towers.add(new Tower(mouseX, mouseY, int(random(-120, -60)), 120, sniper));
      boxes.add(new Hitbox(mouseX, mouseY));
      money = money - 700;
  }
  
  //if(lazer.clicked && money >= 1000) {
  //  towers.add(new Tower(mouseX, mouseY, 
  //}
}


void buildText() {
  textFont(holder);
  textSize(40);
  fill(255, 0, 0);
  textFont(holder);
  text("Build Mode", 850, 600);
}

void buildbuttonSpace() {
  //Button Area
  stroke(lbrown);
  strokeWeight(10);
  fill(brown);
  rect(850, 400, 300, 800);

  //Buttons
  textFont(holderme);
  shotgun.show();
  gunner.show();
  build.show();
  snipers.show();
  lazer.show();

  //Text
  fill(0);
  textFont(holderth);
  textSize(40);
  text("Wave:", 100, 50);
  textFont(number);
  textSize(50);
  text(t, 200, 50);
}
