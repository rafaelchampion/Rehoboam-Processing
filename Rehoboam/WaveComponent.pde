class WaveComponent {
  float amplitude;
  float period;
  float phase;
  boolean direction;

  WaveComponent(float amp, float period, float phase, boolean direction) {
    this.amplitude = amp;
    this.period = period;
    this.phase = phase;
    this.direction = direction;
  }

  float evaluate(float x) {
    return sin(this.phase + (TWO_PI * x) / this.period) * this.amplitude;
  }

  void update() {
    float increment = -0.08; //random(-0.1, 0);
    if(this.direction == true){
      this.phase = this.phase + increment ;
    }
    else{
      this.phase = this.phase - increment ;
    }
  }
}
