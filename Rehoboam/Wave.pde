class Wave {

  ArrayList<WaveComponent> components;

  Wave(int cAmount, float minCamp, float maxCamp, float minPeriod, float maxPeriod) {
    components = new ArrayList<WaveComponent>();
    for (int i = 0; i<cAmount; i++) {
      components.add(new WaveComponent(random(minCamp, maxCamp), random(minPeriod, maxPeriod), random(TWO_PI), random(1) > 0.5));
    }
  }

  void Draw(float r, float wavePosAdd) {
    float wavePos = 1;
    float y = 0;
    float lastY = 0;
    beginShape();
    for (float i=0; i<=TWO_PI; i+= TWO_PI/1000) {
      for (WaveComponent c : components) {
        //EXPERIMENTAL DIVERGENCE
        //TODO: Make a divergence object (peak amplitude, atuation length, duration, etc)
        //TODO: Make a divergence array
        //TODO: Dinamically create divergencies
        //TODO: Dinamically check divergency array and deal properly
        if (wavePos >= 750 && wavePos <= 780) {
          y += c.evaluate(wavePos) * (map(abs(765-wavePos), 15, 0, divergenceSeverity/10, divergenceSeverity));
        } else {
          y += c.evaluate(wavePos);
        }
      }
      float dx = (r + ((y - lastY)/components.size()))* sin(i);
      float dy = (r + ((y - lastY)/components.size()))* cos(i);
      vertex(dx, dy);
      wavePos+=wavePosAdd;
      lastY = y;
    }
    endShape(CLOSE);
    for (WaveComponent c : components) {
      c.update();
    }
  }
}
