import ddf.minim.*;
import ddf.minim.ugens.*;

Minim      minim;
//FilePlayer filePlayer;
Sampler [] sound = new Sampler[7];
String [] playlistName = new String[3];
int iPlaylist=0;
AudioOutput out;

int time;
float xMetronome; 
int initX=153;
int y = 383 + 7 * 45;
int bpm = 80;
int iMetronome;
int lastIMetronome = -1;
boolean playToggle = false;

void setupAudio() {
  minim = new Minim(this);
  out = minim.getLineOut();
  
  playlistName[0] = "House";
  playlistName[1] = "Rock";
  playlistName[2] = "Custom";
  
  setPlaylist(0);
}

void Playlist(int n){
    setPlaylist(n);
}

void setPlaylist(int n) {
 for(int i = 0; i < 7; i++) {
    sound[i] = new Sampler(playlistName[n] + str(i+1) + ".wav", 7, minim);
    sound[i].patch(out);
  } 
}

int calculateMetronomeColumn(){
  iMetronome = ((millis()-time)/120) % 16;
  return iMetronome;
}

int calculateMetronomeXPosition() {
  calculateMetronomeColumn();//Number between 0 and 15, it changes in every beat
  
  if(iMetronome != lastIMetronome) {
    playNotes();
  }
  
  lastIMetronome = iMetronome;
  return initX + (iMetronome) * 45; 
}

void playNotes() {
  for(int i = 0; i < 16; i++) {
    for(int j = 0; j < 7; j++) {
      StepButton sb = sBList.get(j+iMetronome*7);
      if(sb.isClicked && i == 0) {
        sb.playSound();
      }
    }
  }
}

void MasterVolume(int theMVol) {
  out.setGain(theMVol);
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
