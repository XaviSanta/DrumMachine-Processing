import ddf.minim.*;
import ddf.minim.ugens.*;
Minim minim;
FilePlayer filePlayer;

ArrayList<AudioPlayer> audioList = new ArrayList<AudioPlayer>();

int time;
float x; 
int initX=153;
int y = 383 + 7 * 45;
float speed = 1;


void setupAudio() {
  minim = new Minim(this);
  
  audioList.add(minim.loadFile("bongo1.wav"));
  audioList.add(minim.loadFile("bongo7.wav"));
  audioList.add(minim.loadFile("bongo1.wav"));
  audioList.add(minim.loadFile("bongo7.wav"));
  
  audioList.add(minim.loadFile("bongo1.wav"));
  audioList.add(minim.loadFile("bongo7.wav"));
  audioList.add(minim.loadFile("bongo1.wav"));
  audioList.add(minim.loadFile("bongo7.wav"));
  
  audioList.add(minim.loadFile("bongo1.wav"));
  audioList.add(minim.loadFile("bongo7.wav"));
  audioList.add(minim.loadFile("bongo1.wav"));
  audioList.add(minim.loadFile("bongo7.wav"));
  
  audioList.add(minim.loadFile("bongo1.wav"));
  audioList.add(minim.loadFile("bongo7.wav"));
  audioList.add(minim.loadFile("bongo1.wav"));
  audioList.add(minim.loadFile("bongo7.wav"));
}

void drawMetronome() {
  x = calculateMetronomeXPosition();
  rect(x,y, size,size,15,15,15,15);
}

float calculateMetronomeXPosition() {
 return initX + (((millis() - time)/500) % 16) * 45; 
}
