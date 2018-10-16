PImage[] textures = new PImage[15];
ArrayList<Ball> balls = new ArrayList<Ball>();
Ball tempBall;

void setup(){
  size(600, 400, P3D);
  
  
  
  for(int i = 0; i < textures.length; i++){
    textures[i] = loadImage(i+1 + ".jpg");
  }
  
}

void draw(){
  background(0);
  
  //camera(width/2+map(mouseX, 0, width, -2*width, 2*width), 
  //       height/2+map(mouseY, 0, height, -height, height),
  //       height/2/tan(PI*30.0 / 180.0), 
  //       width, height/2.0, 0, 
  //       0, 1, 0);
         
  if(mousePressed){
    PImage tex = textures[int(random(textures.length))];
    tempBall = new Ball(tex, mouseX, mouseY, 0, 10);
    balls.add(tempBall);
  }
  
  for(int i = 0; i < balls.size(); i++){
    tempBall = balls.get(i);
    tempBall.move();
    tempBall.display();
  }
}
