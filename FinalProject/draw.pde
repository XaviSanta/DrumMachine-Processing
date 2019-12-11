/* Xavier Santamaria */

int hoverButton; // Saves the id of the button we are hovering, otherwise -1

void draw() {
  background(0);
  strokeWeight(2);
  
  drawTable(); // Draw the background
  if (playToggle) drawMetronome(); // If play button is activated draw the metronome
  drawMeshStepButtons();
  drawSynth(); // Code to draw the wave of the output sounds
  drawRecording(); // Draw in screen 'Recording...' if we are recording
  drawHoveredButton(); // Emphasize the button the mouse in 
  drawPlaylistName(); // Draw at the top of the screen which playlist are we using 
}


/*
  Draw the rectangle that represents the "drum machine table"
*/
void drawTable() {
  stroke(0);
  fill(tableColor);
  rect(0, 0, width, height, 35, 35, 35, 35);
}

/*
  Get the position of the metronome and draw the rectangle in the position we got
*/
void drawMetronome() {
  xMetronome = calculateMetronomeXPosition();
  fill(buttonStepColorOn);
  rect(xMetronome, y +5, size, size -10, 80, 80, 5,5); 
}

/*
  Draw the squares (StepButtons)
*/ 
void drawMeshStepButtons() {
  stroke(0);
  for(int i = 0; i < sBList.size(); i++){
    sBList.get(i).drawSquare();
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
    //line( x1, 150 - out.right.get(i)*50, x2, 150 - out.right.get(i+1)*50);
  }  
  translate(0,-100);
}

void drawRecording() {
  if(microhponeWorks) {
    
    // If we are recording a sound(trigger) it prints recording... during 2 seconds and then save the recorded sound
    if(recorder.isRecording()){ 
      recorderTimer++;
      text("Recording...", 30, height*.5 - 20);
      if(recorderTimer > 30){ // When time gets to its limited save the Sample sound
        saveRecord();
      }
    }
  }
  
  // if we are recording the Song, print in screen 'Recording...'
  if(recorderOut.isRecording()) {
    text("Recording...", width*.9, height*.4 - 20);
  }
}

void drawHoveredButton() { // If there is a button to hover, draw it
  if(hoverButton != -1) sBList.get(hoverButton).drawSquare(); 
}

void drawPlaylistName() {
  textAlign(CENTER);
  textSize(18);
  text("Playing " + playlistName[iPlaylist] + " playlist", width/2, 25);
  textAlign(LEFT);
  textSize(12);
}
