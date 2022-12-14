//Tower Defense Game
//David Bakker
//Programming 12

// ================ GLOBAL VARIABLES =================

final int INTRO    = 0;
final int PLAY     = 1;
final int BUILD    = 2;
final int GAMEOVER = 3;
final int MAP = 4;
int mode;

//Towers
final int gun = 1;
final int AOE = 2;
final int sniper = 3;

//Tower costs
final int[] price = {330, 400, 450};

//Pallette
color white = #ffffff;
color black = #000000;
color pink =  #ffafcc;
color blue =  #a2d2ff;
color purple = #cdb4db;
color lBlue = #bde0fe;
color lPink = #ffc8dd;
color green = #a7c957;
color dgreen = #6a994e;
color yellow = #ffff3f;
color road = #f2c14e;
color brown = #bc6c25;
color lbrown = #dda15e;


//Nodes Codes
boolean map1checker = false;
boolean map2checker = false;
//Mouse & Keyboard interaction variables
boolean mouseReleased;
boolean wasPressed;

//Buttons
Button start;
Button wave;
Button build;
Button gunner;
Button shotgun;
Button snipers;
Button lazer;
Button again;
Button maps1;
Button maps2;

//Collections of objects
Node[] nodes;
Ring ringShoot;
ArrayList<Mob> mobs;
ArrayList<Tower> towers;
ArrayList<Bullet> bullets;
ArrayList<Hitbox> boxes;

//Images and Gifs
Gif introAnimation;
PImage map1, map2, map2back;

//Fonts
PFont holder, holderth, holderme, number;


// ===================== SETUP =========================

void setup() {
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  size(1000, 800);
  initializeModes();
  //makeNodes();
  initializeVariables();
  makeButtons();
}

void initializeModes() {
  //set up the default mode for things
  rectMode(CENTER);
  imageMode(CENTER);
  textAlign(CENTER, CENTER);
  mode = INTRO;
}

void initializeVariables() {
  //Load Images & Gifs
  introAnimation = new Gif("undertale/frame_", "_delay-0.1s.gif", 102, 5, width/2, height/2, width, height);
  map1 = loadImage("map1.png");
  map2 = loadImage("map2pic.png");
  map2back = loadImage("map2.jpeg");
  //Load Fonts
  holder = createFont("holder.otf", 1);
  holderth = createFont("holderth.otf", 1);
  holderme = createFont("holderme.otf", 1);
  number = createFont("number.ttf", 1);

  //Create Collections of Objects
  mobs = new ArrayList<Mob>();
  towers = new ArrayList<Tower>();
  bullets = new ArrayList<Bullet>();
  boxes = new ArrayList<Hitbox>();

  //AOE Ring
  ringShoot = new Ring(0, 0);
}

void makeButtons() {
  //INTRO - Start
  start = new Button("START", width/2, 3*height/4, 200, 100, white, black);
  //Map selection buttons
  maps1 = new Button("", 300, height/2, 200, 200, black, blue);
  maps2 = new Button("", 700, height/2, 200, 200, black, blue);

  //PLAY - Next Wave, To Build Mode
  wave = new Button("-->", 790, 700, 100, 100, dgreen, white);
  //BUILD - To play mode, Buy Sniper, Buy Gun, Buy AoE
  build = new Button("BUILD", 910, 700, 100, 100, dgreen, white);
  gunner = new Button("GUNNER", 850, 200, 200, 100, blue, black);
  shotgun = new Button("SHOTGUN", 850, 325, 200, 100, yellow, black);
  snipers = new Button("SNIPER", 850, 450, 200, 100, white, black);
  lazer = new Button("LAZER", 850, 575, 200, 100, pink, lPink);
  //GAMEOVER - Reset
  again = new Button("AGAIN", width/2, height/2, 200, 200, black, white);
}

void makeNodes() {
  //Plot the nodes on the map
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
}


// ===================== DRAW ===========================

void draw() {
  click();
  if (mode == INTRO) {
    intro();
  } else if (mode == PLAY) {
    play();
  } else if (mode == MAP) {
    maps();
  } else if (mode == BUILD) {
    build();
  } else if (mode == GAMEOVER) {
    gameOver();
  }
  textFont(number);
  textSize(20);
  text(mouseX + ", " + mouseY, mouseX, mouseY - 20);
}
