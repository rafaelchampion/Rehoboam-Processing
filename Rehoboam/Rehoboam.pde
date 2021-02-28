//Experimental divergency factor to multiply the current wave's amplitude
//DEFAULT: 15
float divergenceSeverity = 20;

//Interface radius
//Greater radius affects performance
//DEFAULT: 250
float radius = 350;

//Amount of overlapping waves
//Too many waves may reduce performance
//DEFAULT: 20
int waveAmount = 20;

// Randomness of a single wave's period and amplitude
// Too many components may smooth a wave too much
//DEFAULT: 5
int componentsPerWave = 5; 

//Factor in which a wave's period will be traveled by the drawer
//DEFAULT: 2
float wavePosAdd = 2;

//Minimum amplitude of a wave component
//Affects a wave's shape
//DEFAULT: 10
float minComponentAmp = 10;

//Maximum amplitude of a wave component
//Affects a wave's shape
//DEFAULT: 15
float maxComponentAmp = 15;

//Minimum period of a wave component
//Affects a wave's shape
//DEFAULT: 100
float minComponentPeriod = 100;

//Maximum period of a wave component
//Affects a wave's shape
//DEFAULT: 500
float maxComponentPeriod = 500;

ArrayList<Wave> waves = new ArrayList<Wave>();

void setup() {

  frameRate(60);
  fullScreen();

  for (int i = 0; i<waveAmount; i++) {
    waves.add(new Wave(componentsPerWave, minComponentAmp, maxComponentAmp, minComponentPeriod, maxComponentPeriod));
  }
}


void draw() {
  background(255);
  translate(width/2, height/2);
  fill(0, 0, 0, 30);
  noStroke();

  for (int i =0; i < waves.size(); i++) {
    waves.get(i).Draw(radius, wavePosAdd);
  }

  drawCenterCircle();
}

void drawCenterCircle() {
  fill(255);
  noStroke();
  ellipse(0, 0, radius*2, radius*2);
}
