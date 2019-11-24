void draw() {
  background(0);
  drawTable();
  drawMeshStepButtons();
  drawSynth();
  if (playToggle) drawMetronome();
}

void drawTable() {
  stroke(0);
  fill(tableColor);
  rect(0, 0, width, height, 35, 35, 35, 35);
}

void drawMeshStepButtons() {
  strokeWeight(2);
  stroke(0);

  for (int i = 0; i < 4*4; i++) {
    for (int j = 0; j < 7; j++) {
      StepButton sb = sBList.get(i*7 + j);
      sb.drawSquare();
    }
  }
}

void drawSynth() {
  translate(0,100);
  for( int i = 0; i < out.bufferSize() - 1; i++ )
  {
    // find the x position of each buffer value
    float x1  =  map( i, 0, out.bufferSize(), 0, width );
    float x2  =  map( i+1, 0, out.bufferSize(), 0, width );
    // draw a line from one buffer position to the next for both channels
    line( x1, 50 - out.left.get(i)*50, x2, 50 - out.left.get(i+1)*50);
    line( x1, 150 - out.right.get(i)*50, x2, 150 - out.right.get(i+1)*50);
  }  
  translate(0,-100);
}
void drawMetronome() {
  xMetronome = calculateMetronomeXPosition();
  rect(xMetronome, y, size, size, 15, 15, 15, 15);
}
