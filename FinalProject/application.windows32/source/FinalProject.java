import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 
import java.util.*; 
import ddf.minim.*; 
import ddf.minim.ugens.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class FinalProject extends PApplet {

/* Xavier Santamaria */

 

ControlP5 cp5;
String fileName;

public void setup() {
  
  cp5 = new ControlP5(this);
  
  setupAudio();  
  setupMicrphone();
  
  setupRecorderButtons();
  // this recorderIn (input) is not used but i had to instantiate one recorder 
  // otherwise the comprobations i do in the draw throw errors
  setupRecorderIn(0); 
  
  setupRecorderOutButton(); // Save the song
  setupRecorderOut();
  
  setupMasterVolumeSlider();
  setupDropDownPlaylist();
  
  setupSaveFileButton(); // Save File = save in a file the buttons the user has clicked as a configuration
  setupDropDownFileButtons();
  
  setupPlayPauseToggle();
  setupClearButton();

  setupStepButtons(); // Step button are the buttons that once clicked produce sounds
}

public void mouseClicked() {  
  if (isInStepButtonRange(mouseX, mouseY)) {
    getStepButton(mouseX, mouseY).activate();
  }
}

public void mouseMoved() {
  if (isInStepButtonRange(mouseX, mouseY)) {
     hoverButton = getStepButton(mouseX, mouseY).id;
  }
  else {
    hoverButton = -1;
  }
}


/* Xavier Santamaria */




Minim      minim;
//FilePlayer filePlayer;
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

public void setupAudio() {
  minim = new Minim(this);
  out = minim.getLineOut();
  
  playlistName[0] = "House";
  playlistName[1] = "Rock";
  playlistName[2] = "Custom";
}

public void setPlaylist(int n) {
  for(int i = 0; i < 7; i++) {
    sound[i] = new Sampler(playlistName[n] + str(i+1) + ".wav", 7, minim); // Load the sounds of the playlist 
    sound[i].patch(out);  // And then patch them all in the output
  } 
  
  iPlaylist = n; // Save in a variable the playlist we are using so we can print later in a text
}

public int calculateMetronomeColumn(){
  iMetronome = ((millis()-time)/120) % 16;
  return iMetronome;
}

public int calculateMetronomeXPosition() {
  calculateMetronomeColumn();//Number between 0 and 15, it changes in every beat
  
  if(iMetronome != lastIMetronome) { // if it changes, play the column notes
    playNotes();
  }
  
  lastIMetronome = iMetronome;
  return initX + (iMetronome) * 45; 
}

public void playNotes() {
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
/* Xavier Santamaria */

AudioRecorder recorder;
AudioRecorder recorderOut;
int counterSongs = 0;
AudioInput in;
int numCustom = 0;
float recorderTimer;
boolean microhponeWorks = false;

public void setupMicrphone() {
  try{
    in = minim.getLineIn(); 
    microhponeWorks = true;
  } catch (Exception e) {
    println("ERROR setting up microphone. " + e);
  }
}

public void setupRecorderIn(int n) {
  recorder = minim.createRecorder(in, "/data/Custom"+n+".wav");
}

public void setupRecorderOut() {
  recorderOut = minim.createRecorder(out, "/recordedSongs/song" + counterSongs +".wav");
}

public void RecordOutput() {
  if ( recorderOut.isRecording() ) saveRecordOut();
  else {
    setupRecorderOut();
    recorderOut.beginRecord();
    println("Recording...");
  }
}

public void startRecording() {
  out.mute();
  recorder.beginRecord();
  recorderTimer=0; 
  println("BeginRecording");
}

public void saveRecord() {
  recorder.save();
  recorder.endRecord();
  out.unmute();
  println("Done saveing.");
  setPlaylist(2);
}

public void saveRecordOut() {
  recorderOut.save();
  recorderOut.endRecord();
  println("Done saving. New song available in './recordedSongs/song" + counterSongs + ".wav' \n");
  counterSongs++;
}

public void Record1() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(1);
    startRecording();
  }
}

public void Record2() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(2);
    startRecording();
  }
}

public void Record3() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(3);
    startRecording();
  }
}

public void Record4() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(4);
    startRecording();
  }
}

public void Record5() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(5);
    startRecording();
  }
}

public void Record6() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(6);
    startRecording();
  }
}

public void Record7() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(7);
    startRecording();
  }
}
/* Xavier Santamaria */

DropdownList dropDownListPlaylist;
DropdownList dropDownListFileButtons;

public void setupRecorderButtons() {
  for (int i = 0; i < 7; i++) {
    String volRow = "Record" + Integer.toString(1+i);
    cp5.addButton(volRow)
      .setPosition(30, size*i + height*.5f)
      .setSize(size*2, size)
      .setColorBackground(buttonStepColorOff)
      .setColorForeground(secondaryColor)
      .setColorActive(buttonStepColorOn);
  }
}

public void setupRecorderOutButton() {
  cp5.addToggle("RecordOutput")
      .setPosition(width*.9f, height*.4f)
      .setSize(size + size/2, size)
      .setColorBackground(buttonStepColorOff)
      .setColorForeground(secondaryColor)
      .setColorLabel(buttonStepColorOff)
      .setColorActive(buttonStepColorOn);
}

public void setupMasterVolumeSlider() {
  cp5.addSlider("MasterVolume")
    .setPosition(30, 50)
    .setSize(100, 20)
    .setRange(-24, 24)
    .setValue(0)
    .setColorBackground(buttonStepColorOff)
    .setColorLabel(buttonStepColorOff)
    .setColorForeground(buttonStepColorOn);


  for (int i = 0; i < 7; i++) {
    String volRow = "Volume" + Integer.toString(1+i);
    cp5.addSlider(volRow)
      .setPosition(width*.15f+size*16 + 5, size*i + height*.5f + size/2.5f)
      .setSize(80, 10)
      .setRange(-24, 24)
      .setValue(0)
      .setColorBackground(buttonStepColorOff)
      .setColorForeground(buttonStepColorOn);
  }
}
public void MasterVolume(int theMVol) {
  out.setGain(theMVol);
}


public void setupDropDownPlaylist() {
  dropDownListPlaylist = cp5.addDropdownList("Playlist")
    .setPosition(30, 80)
    .setBackgroundColor(buttonStepColorOn)
    .setItemHeight(20)
    .setBarHeight(20)
    .setValue(1)
    .setOpen(false)
    .setColorBackground(buttonStepColorOff)
    .setColorActive(tableColor)
    .setColorForeground(buttonStepColorOn);

  for (int i = 0; i < playlistName.length; i++) {
    dropDownListPlaylist.addItem(playlistName[i], i);
  }
}
public void Playlist(int n){
    setPlaylist(n);
}

public void setupSaveFileButton() {
  cp5.addButton("saveButtonsToFile")
      .setPosition(30, 200)
      .setSize(size*2, size)
      .setColorBackground(buttonStepColorOff)
      .setColorForeground(secondaryColor)
      .setColorActive(buttonStepColorOn);
}

public void setupDropDownFileButtons() {
  dropDownListFileButtons = cp5.addDropdownList("DDButtonsFile")
    .setPosition(30, 260)
    .setBackgroundColor(buttonStepColorOn)
    .setItemHeight(20)
    .setBarHeight(20)
    .setOpen(false)
    .setColorBackground(buttonStepColorOff)
    .setColorActive(tableColor)
    .setColorForeground(buttonStepColorOn); 
    
  dropDownListFileButtons.addItem("Demo1" , 0);
  dropDownListFileButtons.addItem("Demo2" , 1);
  dropDownListFileButtons.addItem("Custom" ,2);
  
}

public void setupPlayPauseToggle() {
  cp5.addToggle("PlayPause")
    .setPosition(width*.9f, 50)
    .setSize(35, 35)
    .setValue(false)
    .setColorBackground(buttonStepColorOff)
    .setColorForeground(secondaryColor)
    .setColorLabel(buttonStepColorOff)
    .setColorActive(buttonStepColorOn);
}
public void PlayPause(boolean theFlag) {
  playToggle = theFlag;
  time = millis(); //To start from the initial column
}


public void setupClearButton() {
  cp5.addButton("Clear")
    .setPosition(width*.85f, 50)
    .setSize(35, 35)
    .setColorBackground(buttonStepColorOff)
    .setColorForeground(secondaryColor)
    .setColorActive(buttonStepColorOn);
}
public void Clear() {
  for (int i = 0; i < sBList.size(); i++) {
    sBList.get(i).isClicked = false;
  }
}
/* Xavier Santamaria */

public void saveButtonsToFile() {
  String listButtonsClicked = "";
  for(StepButton sb : sBList) {
   if(sb.isClicked){
     listButtonsClicked += " " + sb.id;
   }
  }
  
  String[] splitedList = split(listButtonsClicked, ' ');
  saveStrings("/savedButtons/SavedButtons2.txt", splitedList);
  println("Configuration buttons saved in './savedButtons/SavedButtons2.txt'");
}

public void activateButtonsFromFile(int n) {
  Clear();
  String[] idButtons = loadStrings("/savedButtons/SavedButtons" + n + ".txt");
  for(int i = 1; i < idButtons.length; i++) {
    sBList.get(Integer.parseInt(idButtons[i])).activate();
  }
}

public void DDButtonsFile(int n) { // Drop Down Buttons
  activateButtonsFromFile(n);
}
/* Xavier Santamaria */

int size = 45;
ArrayList<StepButton> sBList = new ArrayList<StepButton>();

public void setupStepButtons() {
  int id = 0;
  for (int i = 0; i < 16; i++) {
    for (int j = 0; j < 7; j++) {
      StepButton sB = new StepButton(i, j, id);
      sBList.add(sB);
      id++;
    }
  }
}

public boolean isInStepButtonRange(int x, int y) {
  if (x < 152 || x > 152 + 16 * size || 
    y < 382 || y > 382 + 7 *  size) {
    return false;
  } else {
    return true;
  }
}

public StepButton getStepButton(int x, int y) {
  int id = getButtonIdFromCoordenates(x, y);
  return sBList.get(id);
}

public int getButtonIdFromCoordenates(int x, int y) {
  int xInitial = 154;
  int yInitial = 385;

  int col = (x-xInitial)/size;
  int row = (y-yInitial)/size;
  return col * 7 + row;
}

class StepButton { 
  int col, row, id; 
  boolean isClicked;
  
  
  StepButton (int col, int row, int id) {  
    this.col = col;
    this.row = row;
    this.id = id;
    isClicked = false;
  } 

  public int getId() {
    return id;
  }

  public void activate() {
    if (isClicked) {
      isClicked = false;
    } else {
      isClicked = true;
      playSound();
    }
  }

  public void playSound() {
    sound[row].trigger();
  }

  public void drawSquare() {
    setButtonColor();

    translate(width*.15f + col*size, height*.5f + row*size);
    
    rect(0, 0, size, size, 15, 15, 15, 15);
    drawNumber();
    
    translate(-width*.15f -col*size, -height*.5f -row*size);
    
    stroke(255);
    strokeWeight(2);
  }

  public void hover() {
    stroke(255,234,21);
    drawSquare();
    
  }
  
  public void setButtonColor() {
    if(hoverButton == id) {
      stroke(secondaryColor);
      strokeWeight(4);
    }
    else {
      stroke(255);
      strokeWeight(2);
    }
    if (this.isClicked) {
      fill(buttonStepColorOn);
    } else {
      fill(buttonStepColorOff);
    }
  }

  public void drawNumber() {
    if (row == 0 && (col % 4) == 0) {
      translate(size/2 - 3, -size*0.1f);
      fill(buttonStepColorOff);
      textSize(15);
      
      text(4*col/16+1, 0, 0); //To write 1, 2, 3, 4
      
      translate(-size/2 + 3, size*0.1f);
    }
    if (row == 6) {
      translate(size/2 - 5, size*1.5f);
      fill(buttonStepColorOff);
      textSize(15);
      
      text(col + 1, 0, 0);
      
      translate(-size/2 + 5, -size*1.5f);
    }
  }
} 
/* Xavier Santamaria */
int tableColor          = color(162, 213, 242);
int buttonStepColorOff  = color(7, 104, 159);
int buttonStepColorOn   = color(255, 126, 103);
int secondaryColor      = color(240, 110, 90);
/* Xavier Santamaria */

int hoverButton;

public void draw() {
  background(0);
  strokeWeight(2);
  
  drawTable();
  
  if (playToggle) drawMetronome();
  
  drawMeshStepButtons();
  drawSynth();
  
  drawRecording();
  
  drawHoveredButton();
  
  drawPlaylistName();
}



public void drawTable() {
  stroke(0);
  fill(tableColor);
  rect(0, 0, width, height, 35, 35, 35, 35);
}

public void drawMeshStepButtons() {
  stroke(0);
  for(int i = 0; i < sBList.size(); i++){
    sBList.get(i).drawSquare();
  }
}

public void drawSynth() {
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

public void drawMetronome() {
  xMetronome = calculateMetronomeXPosition();
  fill(buttonStepColorOn);
  rect(xMetronome, y +5, size, size -10, 80, 80, 5,5);
}

public void drawRecording() {
  if(microhponeWorks) {
    if(recorder.isRecording()){
      recorderTimer++;
      text("Recording...", 30, height*.5f - 20);
      if(recorderTimer > 30){
        saveRecord();
      }
    }
  }
  
 if(recorderOut.isRecording()) {
    text("Recording...", width*.9f, height*.4f - 20);
 }
}

public void drawHoveredButton() { 
  if(hoverButton != -1) sBList.get(hoverButton).drawSquare(); 
}

public void drawPlaylistName() {
  textAlign(CENTER);
  textSize(18);
  text("Playing " + playlistName[iPlaylist] + " playlist", width/2, 25);
  textAlign(LEFT);
  textSize(12);
}
  public void settings() {  size(1024, 768); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "FinalProject" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
