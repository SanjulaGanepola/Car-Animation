PImage img;//define a reference to an image object
PImage car1;//define a reference to an image object
PImage car2;//define a reference to an image object
PImage car3;//define a reference to an image object
PImage car4;//define a reference to an image object
PImage car5;//define a reference to an image object
PImage carboom;//define a reference to an image object
int i = 1;// varialbe for case number
int x = 1;//x coordinate of first car
int y = 20;//y coordinate of first car
int a = 500;//x coordinate of second car
int b = 390;//y coordinate of second car
import ddf.minim.*;// need to load the MINIM library
Minim minim;// create a MINIM object
AudioPlayer carsound;
AudioPlayer carcrash;
  
  void setup(){ // define a reference to an image object  void setup(){
  minim = new Minim(this);//loads minum
  size (500,500);// set to the width and height of image
  
  //load the image into memory
  img = loadImage("Images/Road Background.jpg");
  car1 = loadImage("Images/Car going to the Right.gif");
  car2 = loadImage("Images/Car going to the Left.gif");
  car3 = loadImage("Images/Car going to the Right Rotated.gif");
  car4 = loadImage("Images/Car going to the Left Rotated.gif");
  car5 = loadImage("Images/Car going to the Right - Up Rotated.gif");
  carboom = loadImage("Images/Car Boom.gif");
  
  //resize image
  img.resize(500,500);
  car1.resize(80,50);
  car2.resize(80,50);
  car3.resize(80,50);
  car4.resize(80,50);
  car5.resize(80,50);
  carboom.resize(150,150);
  
  //load the sound into memory
  carsound = minim.loadFile("Sounds/car sound.mp3");
  carcrash = minim.loadFile("Sounds/car crash.mp3");
 }
 
 void draw(){
 background(img);//sets background image
 
 switch (i) {//what state of the animation are we in
 case 1://first car moving right
 carsound.play();//plays sound of car driving
 x = x + 3; //speed of car
 image(car1, x, y);//draws car
 if (x>220) {//if statement to move to next case
 i =i + 1;
 }
 break;

 case 2://first car moving down
 y = y + 3;//speed of car
 image(car3, x, y);//draws car
 if (y>140) {//if statement to move to next case
 i = i + 1;
 }
 break;
  
 case 3://first car moving right and second moving left
 x = x - 3;//speed of car
 a = a - 3;//speed of car
 image(car2, x, y);//draws car
 image(car2, a, b);//draws car
 if ((x<100)&&(a<340)){//if statement to move to next case
 i = i + 1;
 }
 break;
 
 case 4://first car moving down and second car moving up
 y = y + 3;//speed of car
 b = b - 3;//speed of car
 image(car4, x, y);//draws car
 image(car5, a, b);//draws car
 if ((y>265)&&(b<295)) {//if statement to move to next case
 i = i + 1;
 }
 break;
 
 case 5://first car moving right and second moving left
 x = x + 3;//speed of car
 a = a - 3;//speed of car
 image(car1, x, y);//draws car
 image(car2, a, b);//draws car
 if((x>200)&&(a<280)) {//if statement to move to next case
 carcrash.play();//plays sound of car crashing
 i = i + 1;
 }
 
 case 6://car crash
 if((x>200)&&(a<280)) {//if statement to move to next case
 image(carboom, 170,220);//draws car
 }
 break;
 default:
 break;
 }
}

void stop() { // this helps clean up after sounds are played
carsound.close();
carcrash.close();
minim.stop();
}