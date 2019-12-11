/* Xavier Santamaria */

import ddf.minim.*;
import ddf.minim.ugens.*;

Minim minim;
Sampler [] sound = new Sampler[7];
String [] playlistName = new String[3];
AudioOutput out;
int iPlaylist=0;

int time;
float xMetronome; 
int initX=153;
int y = 383 + 7 * 45;
int iMetronome, lastIMetronome = -1;
boolean playToggle = false;

void setupAudio() {
  minim = new Minim(this);
  out = minim.getLineOut();
  
  playlistName[0] = "House";
  playlistName[1] = "Rock";
  playlistName[2] = "Custom";
}

void setPlaylist(int n) { // Given n: (0:House, 1:Rock, 2:Custom) it loads the sounds of that playlist
  for(int i = 0; i < 7; i++) {
    sound[i] = new Sampler(playlistName[n] + str(i+1) + ".wav", 7, minim); // Load the sounds of the playlist 
    sound[i].patch(out);  // And then patch them all in the output
  } 
  
  iPlaylist = n; // Save in a variable the playlist we are using so we can print later in a text
}

int calculateMetronomeXPosition() {
  calculateMetronomeColumn();//Number between 0 and 15, it changes in every beat
  
  if(iMetronome != lastIMetronome) { // if it changes, play the column notes
    playNotes();
  }
  
  lastIMetronome = iMetronome;
  return initX + (iMetronome) * 45; 
}

int calculateMetronomeColumn(){
  iMetronome = ((millis()-time)/120) % 16;
  return iMetronome;
}

/*
  Play all the sounds in the corresponding column
*/
void playNotes() {
  for(int row = 0; row < 7; row++) {
    StepButton sb = sBList.get(row + iMetronome*7); // Get the column buttons
    if(sb.isClicked) {
      sb.playSound();
    }
  }
}



//void Volume1(int theRowVol) {
//  sound[0].amplitude.;
//}
//void Volume2(int theRowVol) {
//  AudioSample p = audioList.get(1);
//  p.setGain(theRowVol);
//}
//void Volume3(int theRowVol) {
//  AudioSample p = audioList.get(2);
//  p.setGain(theRowVol);
//}
//void Volume4(int theRowVol) {
//  AudioSample p = audioList.get(3);
//  p.setGain(theRowVol);
//}
//void Volume5(int theRowVol) {
//  AudioSample p = audioList.get(4);
//  p.setGain(theRowVol);
//}
//void Volume6(int theRowVol) {
//  AudioSample p = audioList.get(5);
//  p.setGain(theRowVol);
//}
//void Volume7(int theRowVol) {
//  AudioSample p = audioList.get(6);
//  p.setGain(theRowVol);
//}
