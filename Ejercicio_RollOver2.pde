PFont font;
String a;
int fondo, pos, sentido, circ, count;
float angle;

void setup() {
  //frameRate (30);
  size(400, 400);
  font = loadFont("Monospace821BT-Roman-48.vlw");
  a= "Buenos días";
  textSize(48);
  noStroke();
  fondo=255;
  smooth();
  pos=0; //Posición del texto
  sentido=1; //Cambio de sentido del texto
  angle=0; //ángulo de giro
  circ=200; //Color y ctamaño del círculo
  count=0; //Contador de frames para el cambis de background
}

void draw() {
  background (fondo);
  noStroke ();
  fill (80, 180, 180);
  rect (20, 20, 80, 80);
  rect (300, 20, 80, 80);
  rect (20, 300, 80, 80);
  rect (300, 300, 80, 80);

  if (mouseX > 20 && mouseX < 100 && mouseY >= 20 && mouseY <= 100) {
    count++;
    if (count>=30); 
    {
      fondo = int(random (0, 255));
      count = 0;
    }
  } else if (mouseX > 20 && mouseX < 100 && mouseY >= 300 && mouseY <= 380) { 
    fill(0);
    text (a, pos, height/2);
    pos= pos + sentido;
    if (pos >= width -275 || pos <= -5) {
      sentido = sentido * (-1);
    }
  } else if (mouseX > 300 && mouseX < 380 && mouseY >= 300 && mouseY <= 380) {
    pushMatrix ();
    translate(width/2, height/2);
    rotate(PI+angle);
    fill (250, 120, 230);
    rect (-100, -100, 200, 200);
    popMatrix();
    angle=angle+0.05;
    if (angle>=360) {
    angle=0;
    }
    
  } else if (mouseX > 300 && mouseX < 380 && mouseY >= 20 && mouseY <=100 ) {
    fill (150, 250, 120, circ);
    ellipse (200, 200, circ, circ);
    circ--;
    if ( circ <=0) {
      circ = 200;
    }
  } else {
    fondo = 255;
    circ = 200;
    angle = 0;
  }
}