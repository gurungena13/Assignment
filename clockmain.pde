int cx, cy;
float Sec_Hand;
float Min_Hand;
float Hr_Hand;
float Diameter;
float D1;
float D2;
float D3;
int width = 640;
int height = 560;
int radius;

void setup() {
  size(640, 600);
  stroke(255);
  
  radius = min(width, height) / 2;
  Sec_Hand = radius * 0.80;
  Min_Hand = radius * 0.85;
  Hr_Hand = radius * 0.50;
  Diameter = radius * 1.8;
  D1 = radius * 1.9;
  D2 = radius * 1.8;
  D3 = radius * 1.6;
  
  cx = width / 2;
  cy = height / 2;
}


void draw() {
  background(#7475A2);
  textSize(36);
  text("Hybrid",30,50);
  text("Clock",500,50);
  fill(0);
  noStroke();
  ellipse(cx, cy, Diameter, Diameter);
  
  strokeWeight(8);
  stroke(#35015A);
  ellipse(cx, cy, D1, D1);
  
  strokeWeight(8);
  stroke(150);
  ellipse(cx, cy, D2 , D2);
  
  strokeWeight(4);
  stroke(150);
  ellipse(cx, cy, D3, D3 );
  
  
  for (int i = 0; i < 12; i ++) {
      float ang = i * 30 * PI / 180;
      float sina = sin(ang);
      float cosa = cos(ang);
      int x1 = (int)(cx + (Diameter / 2 - 25) * sina);
      int y1 = (int)(cy + (Diameter/ 2 - 25) * cosa);
      int x2 = (int)(cx + Diameter / 2 * sina);
      int y2 = (int)(cy + Diameter / 2 * cosa);
      line(x1, y1, x2, y2);
  }
  
  
   float hr, min, sec;
  hr = hour();
  min = minute();
  sec = second();
  textSize(40);
  fill(#35015A);
  text("                  " + (int)hr + ":" + (int)min + ":" + (int)sec, 1, 590);
  
  
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;
  float m = map(minute() + norm(second(), 0, 60), 0, 60, 0, TWO_PI) - HALF_PI; 
  float h = map(hour() + norm(minute(), 0, 60), 0, 24, 0, TWO_PI * 2) - HALF_PI;
  
  
  stroke(0,0,255);
  strokeWeight(2);
  line(cx, cy, cx + cos(s) * Sec_Hand, cy + sin(s) * Sec_Hand);
  
  stroke(0,255,0);
  strokeWeight(4);
  line(cx, cy, cx + cos(m) * Min_Hand, cy + sin(m) * Min_Hand);
  
  
  stroke(255,0,0);
  strokeWeight(6);
  line(cx, cy, cx + cos(h) *  Hr_Hand, cy + sin(h) *  Hr_Hand);
  
  stroke(255);
  point (cx ,cy );
  
  
}
