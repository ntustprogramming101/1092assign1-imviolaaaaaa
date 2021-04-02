PImage bg;
PImage soilImg;
PImage lifeImg;
PImage grounghogImg;
PImage robotImg;
PImage soldierImg;

float soldierX = 160;
float soldierY;
float soldierXSpeed = 3;

float robotX; 
float robotY; 

float laserX; 
float laserY; 
float laserXSpeed = 2;  
float laserWidth = 40;

final int singleSpace = 80;

final int lifeWidth = 50;
final int lifeSpace = 20;

final int soliderWidth = 80;
final int soldierHeight = 80;

final int robotSpaceX = 160;

final float laserHeight = 10;
final float laserSpaceX = 25;
final float laserSpaceY = 37;

void setup() {
	size(640, 480);
	
  bg = loadImage("img/bg.jpg");
  soilImg = loadImage("img/soil.png");
  lifeImg = loadImage("img/life.png");
  grounghogImg = loadImage("img/groundhog.png");
  robotImg = loadImage("img/robot.png");
  soldierImg = loadImage("img/soldier.png");
  
  //soldier random floor appearance
  soldierY = 160 + 80 * (floor(random(4)));
  
  //robot ramdom appearance
  robotX = 160 + 80 * (floor(random(6))); 
  robotY = 160 + 80 * (floor(random(4)));
  
  //laser
  laserX = robotX - laserSpaceX + 40;
  laserY = robotY + laserSpaceY - (laserHeight/2);
}

void draw() {
  
  // background elements
  image(bg, 0, 0);
  image(soilImg, 0, singleSpace * 2);
  image(lifeImg, 10, 10);
  image(lifeImg, 10 + (lifeWidth + lifeSpace), 10);
  image(lifeImg, 10 + (lifeWidth + lifeSpace)*2, 10);
  
  //grass
  noStroke();
  fill(124, 204, 25);
  rect(0, singleSpace * 2 - 15, 640, 15);
  
  //groundhog
  image(grounghogImg, width/2 - singleSpace / 2 , singleSpace);
  println(width/2 - singleSpace / 2);
  
  //soldier
  image(soldierImg, soldierX, soldierY);
  //soldier movement
  soldierX += soldierXSpeed;
  soldierX %= (width + soliderWidth);
  
  //sun
  strokeWeight(5);
  stroke(255, 255, 0);
  fill(253, 184, 19);
  ellipse(590, 50, 120,120);
  
  //laser
  noStroke();
  fill(255,0,0);
  rect(laserX, laserY, laserWidth, 10, 10);
  
  //laser movement
  laserX -= laserXSpeed;
  if( laserX < robotX - robotSpaceX ){
      laserX = robotX - laserSpaceX + 40;
    }
 
  //robot
  image(robotImg, robotX, robotY);
}
