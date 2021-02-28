class Wave {
  float amplitude;
  float period;
  float phase;
  boolean upOrDown;

  Wave(float amp, float period, float phase, boolean upOrDown) {
    this.amplitude = amp;
    this.period = period;
    this.phase = phase;
    this.upOrDown = upOrDown;
  }

  float evaluate(float x) {
    return sin(this.phase + (TWO_PI * x) / this.period) * this.amplitude;
  }

  void update() {
    float increment = random(-0.2, 0);
    if(this.upOrDown == true){
      this.phase = this.phase + increment ;
    }
    else{
      this.phase = this.phase - increment ;
    }
  }
}
