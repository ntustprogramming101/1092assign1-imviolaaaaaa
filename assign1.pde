PImage bg;
PImage soilImg;
PImage lifeImg;
PImage grounghogImg;
PImage robotImg;
PImage soldierImg;

float soldierX = 160;
float soldierY = 240;
float soldierXSpeed = 5;

float laserX = 345;
float laserXSpeed = 2;


void setup() {
	size(640, 480);
	
  // Enter Your Setup Code Here
  bg = loadImage("img/bg.jpg");
  soilImg = loadImage("img/soil.png");
  lifeImg = loadImage("img/life.png");
  grounghogImg = loadImage("img/groundhog.png");
  robotImg = loadImage("img/robot.png");
  soldierImg = loadImage("img/soldier.png");
  
  //soldier random floor appearance
  soldierY = 160 + 80 * (floor(random(4)));
}

void draw() {
  
  // background elements
  image(bg, 0, 0);
  image(soilImg, 0, 160);
  image(lifeImg, 10, 10);
  image(lifeImg, 80, 10);
  image(lifeImg, 150, 10);
  
  //grass
  noStroke();
  fill(124, 204, 25);
  rect(0, 145, 640, 15);
  
  //groundhog
  image(grounghogImg, 280, 80);
  
  //soldier
  image(soldierImg, soldierX, soldierY);
  //soldier movement
  soldierX += soldierXSpeed;
  soldierX %= (640 + 80);
  
  //sun
  fill(255, 255, 0);
  circle(590, 50, 130);
  
  fill(253, 184, 19);
  circle(590, 50, 120);
  
  //laser
  fill(255,0,0);
  rect(laserX, 197, 40, 10, 10);
  //laser movement
  laserX -= laserXSpeed;
  if( laserX < 160 ){laserX = laserX % 160 +185;}
  
  //robot
  image(robotImg, 320, 160);
}
