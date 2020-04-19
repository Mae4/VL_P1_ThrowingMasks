/*

 In this game, you control the mask using the arrow keys and you have
 to get it to the person coughing. When this happens, you get a point.
 The aim of the game is to get the highest score!
 
 - By Maelys
 
 */


ParticleSystem ps;
PImage mask;
PImage person;
PImage maskPerson;
PVector maskPosition;
PVector maskSpeed;
float offset;
int score = 0;

int OneX = (int)random(50, 750);
int OneY = (int)random(50, 750);
int TwoX = (int)random(50, 750);
int TwoY = (int)random(50, 750);

void setup() 
{
  size(800, 800);  
  mask = loadImage("mask.png");
  mask.resize(60, 30);
  person = loadImage("person.png");
  person.resize(40, 50);
  maskPerson = loadImage("guy.png");
  maskPerson.resize(100, 70);

  maskPosition = new PVector(400-30, 400-15);
  maskSpeed = new PVector(2, 2);

  ps = new ParticleSystem(new PVector(OneX, OneY));
}

void draw() 
{
  offset = random(1, 3);
  background(255, 255, 255);
  ps.addParticle();
  ps.run();

  image(mask, maskPosition.x, maskPosition.y);
  image(person, OneX-20, OneY-20);
  textSize(13);
  fill(0);
  text("*cough*", OneX-60+offset, OneY-20);
  text("*cough*", OneX+20+offset, OneY);
  text("*cough*", OneX-73+offset, OneY+25);

  image(maskPerson, 400-50, 400-35);

  if (keyCode==UP)
  {
    maskPosition.y = maskPosition.y - maskSpeed.y;
  }

  if (keyCode==DOWN)
  {
    maskPosition.y = maskPosition.y + maskSpeed.y;
  }

  if (keyCode==RIGHT)
  {
    maskPosition.x = maskPosition.x + maskSpeed.x;
  }

  if (keyCode==LEFT)
  {
    maskPosition.x = maskPosition.x - maskSpeed.x;
  }

  textSize(30);
  text("Score: "+score, 100, 100);

  float dist = dist(maskPosition.x, maskPosition.y, OneX-20, OneY-20);

  if (dist<40)
  {
    background (255, 0, 0);    
    maskPosition.x = 400;
    maskPosition.y = 400;
    OneX = (int)random(50, 750);
    OneY = (int)random(50, 750);
    ps = new ParticleSystem(new PVector(OneX, OneY));
    score++;
  }
  
  if (maskPosition.x>800-30)
  {
    maskPosition.x=0-30;
  }
  if (maskPosition.x<0-30)
  {
    maskPosition.x=800-30;
  }
  if (maskPosition.y>800-15)
  {
    maskPosition.y=0-15;
  }
  if (maskPosition.y<0-15)
  {
    maskPosition.y=800-15;
  }
}
