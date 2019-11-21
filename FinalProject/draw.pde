void draw() {
  background(0);
  drawTable();
  drawMeshStepButtons();
}

public void drawTable() {
  //rotateX(0.1);
  stroke(0);
  fill(tableColor);
  //rect(width*.05, height*.05, width*.9, height*.9);
  rect(0, 0, width, height, 35, 35, 35, 35);
}

public void drawMeshStepButtons() {
  strokeWeight(2);
  stroke(0);
  
  for (int i = 0; i < 4*4; i++) {
    for (int j = 0; j < 7; j++) {
      StepButton sb = sBList.get(i*7 + j);
      sb.drawSquare();
    }
  }
}
