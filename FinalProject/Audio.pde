import ddf.minim.*;
import ddf.minim.ugens.*;

Minim      minim;
//FilePlayer filePlayer;
Sampler [] sound = new Sampler[7];
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
  
  for(int i = 0; i < 7; i++) {
    sound[i] = new Sampler("sound" + str(i+1) + ".wav", 7, minim);
    sound[i].patch(out);
  }
}

int calculateMetronomeXPosition() {
  iMetronome = ((millis() - time)/(bpm*2)) % 16;
  
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
//  sound[0].amplitude = UGenInput(UGen. , theRowVol);
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
