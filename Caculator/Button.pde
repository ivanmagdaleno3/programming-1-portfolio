class Button{
  //memberr variables
  float x,y,w,h;
  boolean on;
  String val;
 
  
  //constructor
  Button(float tempX,float tempY, float tempW,float tempH,  String tempVal) {
  x = tempX;
  y = tempY;
  w = tempW;
  h = tempH;
  val = tempVal;
 
  on = false;
  }
  
  //display method
  void display() {
    if(on) {
    fill(128);
    } else {
    fill (200);
    }
  rect(x,y,w,h);
  fill(60);
  textSize(14);
  textAlign(LEFT);
  text(val,x+30,y+20);
  }
  
  //rollover method
  void hover (int mx, int my) {
   on = (mx>x && mx<x+w && my>y && my<y+h);
  } 
}
  
 
