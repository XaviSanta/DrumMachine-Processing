import ddf.minim.*;
import ddf.minim.ugens.*;
Minim minim;
FilePlayer filePlayer;

ArrayList<AudioPlayer> audioList = new ArrayList<AudioPlayer>();

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
