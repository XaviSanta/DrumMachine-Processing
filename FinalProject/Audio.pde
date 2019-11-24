import ddf.minim.*;
import ddf.minim.ugens.*;
Minim      minim;
FilePlayer filePlayer;

ArrayList<AudioPlayer> audioList = new ArrayList<AudioPlayer>();

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
  
  audioList.add(minim.loadFile("bongo1.wav"));
  audioList.add(minim.loadFile("bongo7.wav"));
  audioList.add(minim.loadFile("bongo1.wav"));
  audioList.add(minim.loadFile("bongo7.wav"));
  audioList.add(minim.loadFile("bongo1.wav"));
  audioList.add(minim.loadFile("bongo7.wav"));
  audioList.add(minim.loadFile("bongo1.wav"));
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
  for(int i = 0; i < audioList.size(); i++){
    AudioPlayer p = audioList.get(i);
    p.setGain(theMVol);
  }
}

void Volume1(int theRowVol) {
  AudioPlayer p = audioList.get(0);
  p.setGain(theRowVol);
}
void Volume2(int theRowVol) {
  AudioPlayer p = audioList.get(1);
  p.setGain(theRowVol);
}
void Volume3(int theRowVol) {
  AudioPlayer p = audioList.get(2);
  p.setGain(theRowVol);
}
void Volume4(int theRowVol) {
  AudioPlayer p = audioList.get(3);
  p.setGain(theRowVol);
}
void Volume5(int theRowVol) {
  AudioPlayer p = audioList.get(4);
  p.setGain(theRowVol);
}
void Volume6(int theRowVol) {
  AudioPlayer p = audioList.get(5);
  p.setGain(theRowVol);
}
void Volume7(int theRowVol) {
  AudioPlayer p = audioList.get(6);
  p.setGain(theRowVol);
}
