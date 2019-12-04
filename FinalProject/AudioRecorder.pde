AudioRecorder recorder;
AudioRecorder recorderOut;
int counterSongs = 0;
AudioInput in;
int numCustom = 0;
float recorderTimer;
boolean microhponeWorks = false;

void setupMicrphone() {
  try{
    in = minim.getLineIn(); 
    microhponeWorks = true;
  } catch (Exception e) {
    println("ERROR setting up microphone. " + e);
  }
}

void setupRecorderIn(int n) {
  recorder = minim.createRecorder(in, "/data/Custom"+n+".wav");
}
void setupRecorderOut() {
  counterSongs++;
  recorderOut = minim.createRecorder(out, "/recordedSongs/song" + counterSongs +".wav");
}

void RecordOutput() {
  if ( recorderOut.isRecording() ) saveRecordOut();
  else {
    recorderOut.beginRecord();
    println("Recording...");
  }
}

void startRecording() {
  out.mute();
  recorder.beginRecord();
  recorderTimer=0; 
  println("BeginRecording");
}

void saveRecord() {
  recorder.save();
  recorder.endRecord();
  out.unmute();
  println("Done saveing.");
  setPlaylist(2);
}

void saveRecordOut() {
  recorderOut.save();
  recorderOut.endRecord();
  println("Done saveing.");
}

void Record1() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(1);
    startRecording();
  }
}

void Record2() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(2);
    startRecording();
  }
}

void Record3() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(3);
    startRecording();
  }
}

void Record4() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(4);
    startRecording();
  }
}

void Record5() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(5);
    startRecording();
  }
}

void Record6() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(6);
    startRecording();
  }
}

void Record7() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorderIn(7);
    startRecording();
  }
}
