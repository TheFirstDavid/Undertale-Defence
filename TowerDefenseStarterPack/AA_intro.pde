void intro() {
  introAnimation.show();
  
  //title
  pushMatrix();
  textFont(holder);
  textSize(width/13.3);
  fill(255);
  rotate(radians(-width/200));
  text("Undertale Defense", width/2.1, height/4);
  popMatrix();
  
  //Button
  textFont(holderth);
  start.show();
  if(start.clicked) {
    mode = MAP;
  }
}
