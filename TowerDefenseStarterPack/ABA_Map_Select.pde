color r = blue;
color r2 = blue;
void maps() {
  back();
  maps1.show();
  maps2.show();
  image(map1, 300, height/2, 210, 210);
  image(map2, 700, height/2, 210, 210);
  if (maps1.clicked) {
    map1checker = true;
    mode = PLAY;
    nodes = new Node[9];
  nodes[0] = new Node(500, 350, 0, -2);
  nodes[1] = new Node(500, 150, -2, 0);
  nodes[2] = new Node(300, 150, 0, 2);
  nodes[3] = new Node(300, 650, -2, 0);
  nodes[4] = new Node(100, 650, 0, -2);
  nodes[5] = new Node(100, 500, 2, 0);
  nodes[6] = new Node(650, 500, 0, 2);
  nodes[7] = new Node(650, 650, -2, 0);
  nodes[8] = new Node(500, 650, 0, 2);
  } else if (maps2.clicked) {
    map2checker = true;
    mode = PLAY;
    nodes = new Node[9];
  nodes[0] = new Node(300, 350, 0, -2);
  nodes[1] = new Node(300, 50, 2, 0);
  nodes[2] = new Node(450, 50, 0, 2);
  nodes[3] = new Node(450, 450, 2, 0);
  nodes[4] = new Node(600, 450, 0, 2);
  nodes[5] = new Node(600, 600, -2, 0);
  nodes[6] = new Node(150, 600, 0, 2);
  nodes[7] = new Node(150, 700, 2, 0);
  nodes[8] = new Node(500, 700, 0, 2);
  }
}

void back() {
  background(black);
  fill(r);
  noStroke();
  rect(300, height/2, 220, 220);
  fill(r2);
  rect(700, height/2, 220, 220);
  if(mouseX > 190 && mouseX < 410 && mouseY > 290 && mouseY < 510) {
    r = white;
  } else {
    r = blue;
  }
  if(mouseX > 590 && mouseX < 810 && mouseY > 290 && mouseY < 510) {
    r2 = white;
  } else {
    r2 = blue;
  }
  fill(white);
  textFont(holder);
  textSize(100);
  text("Map Select", width/2, 150);
}
