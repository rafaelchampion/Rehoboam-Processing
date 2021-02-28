float r;
int waveAmount;

float wavePosAdd = 50;

ArrayList<ArrayList<Wave>> allWaves = new ArrayList<ArrayList<Wave>>();

void setup() {

  frameRate(1000);
  size(800, 800);
  r = 320;
  waveAmount = 15;

  for (int i = 0; i<waveAmount; i++) {
    allWaves.add(new ArrayList<Wave>());
  }

  for (int i = 0; i < allWaves.size(); i++) {
    allWaves.get(i).add(new Wave(random(10, 50), random(3000, 5000), random(TWO_PI), random(1) > 0.5));
  }
  frameRate(1000);
}


void draw() {
  background(255);
  translate(width/2, height/2);

  fill(230);
  noStroke();

  float wavePos = 1;
  float newY = 0;
  float lastY = 0;

  blendMode(MULTIPLY);

  for (int k = 0; k < allWaves.size(); k++) {
    beginShape();
    for (float i=0; i<=TWO_PI; i+= 0.00628318530718) {
      for (Wave wave : allWaves.get(k)) {
        //EXPERIMENTAL DIVERGENCE
        //TODO: Make a divergence object (peak amplitude, atuation length, duration, etc)
        //TODO: Make a divergence array
        //TODO: Dinamically create divergencies
        //TODO: Dinamically check divergency array and deal properly
        if(wavePos >= 5500 && wavePos <= 6500){
          newY += wave.evaluate(wavePos) * (map(abs(6000-wavePos),500,0,1,20));
        }
        else{
          newY += wave.evaluate(wavePos);
        }
        //newY += wave.evaluate(wavePos);
      }
      float x = (r + ((newY - lastY)/5))* sin(i);
      float y = (r + ((newY - lastY)/5))* cos(i);
      vertex(x, y);
      wavePos+=wavePosAdd;
      lastY = newY;
    }
    wavePos = 0;
    endShape(CLOSE);
  }

  drawCenterCircle();

  for (int k = 0; k<allWaves.size(); k++) {
    for (Wave wave : allWaves.get(k)) {
      wave.update();
    }
  }
}

void drawCenterCircle() {
  blendMode(BLEND);
  fill(255);
  noStroke();
  ellipse(0, 0, 630, 630);
}
