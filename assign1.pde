PImage bg;
PImage soilImg;
PImage lifeImg;
PImage grounghogImg;
PImage robotImg;
PImage soldierImg;

float soldierX = 160;
float soldierY;
float soldierXSpeed = 2;

float robotX; 
float robotY; 

float laserX; 
float laserY; 
float laserXSpeed = 2;  
float laserWidth = 40;

final int SINGLE_SPACE = 80;

final int LIFE_WIDTH = 50;
final int LIFE_SPACE = 20;

final int SOLDIER_WIDTH = 80;
final int SOLDIER_HEIGHT = 80;
final int SOLDIER_STARTY = 160;

final int ROBOT_STARTX = 160;
final int ROBOT_STARTY = 160;

final float LASER_HEIGHT = 10;
final float LASER_OFFSETX = 25;
final float LASER_OFFSETY = 37;

void setup() {
	size(640, 480);
	
  bg = loadImage("img/bg.jpg");
  soilImg = loadImage("img/soil.png");
  lifeImg = loadImage("img/life.png");
  grounghogImg = loadImage("img/groundhog.png");
  robotImg = loadImage("img/robot.png");
  soldierImg = loadImage("img/soldier.png");
  
  //soldier random floor appearance
  soldierY = SOLDIER_STARTY + SINGLE_SPACE * (floor(random(4)));
  
  //robot ramdom appearance
  robotX = ROBOT_STARTX + SINGLE_SPACE * (floor(random(6))); 
  robotY = ROBOT_STARTX + SINGLE_SPACE * (floor(random(4)));
  
  //laser
  laserX = robotX - LASER_OFFSETX + laserWidth;
  laserY = robotY + LASER_OFFSETY - (LASER_HEIGHT/2);
}

void draw() {
  
  // background elements
  image(bg, 0, 0);
  image(soilImg, 0, SINGLE_SPACE * 2);
  
  //life
  image(lifeImg, 10, 10);
  image(lifeImg, 10 + (LIFE_WIDTH + LIFE_SPACE), 10);
  image(lifeImg, 10 + (LIFE_WIDTH + LIFE_SPACE)*2, 10);
  
  //grass
  noStroke();
  fill(124, 204, 25);
  rect(0, SINGLE_SPACE * 2 - 15, width, 15);
  
  //groundhog
  image(grounghogImg, width/2 - SINGLE_SPACE / 2 , SINGLE_SPACE);
  
  //soldier
  image(soldierImg, soldierX, soldierY);
  //soldier movement
  soldierX += soldierXSpeed;
  soldierX %= (width + SOLDIER_WIDTH);
  
  //sun
  strokeWeight(5);
  stroke(255, 255, 0);
  fill(253, 184, 19);
  ellipse(590, 50, 120,120);
  
  //laser
  noStroke();
  fill(255,0,0);
  rect(laserX, laserY, laserWidth, LASER_HEIGHT, 10);
  
  //laser movement
  laserX -= laserXSpeed;
  if( laserX < robotX - ROBOT_STARTX ){
      laserX = robotX - LASER_OFFSETX + laserWidth;
    }
 
  //robot
  image(robotImg, robotX, robotY);
}
