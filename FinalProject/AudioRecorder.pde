AudioRecorder recorder;
AudioInput in;
int numCustom = 0;
float recorderTimer;

void setupMicrphone() {
  in = minim.getLineIn();
}

void setupRecorder(int n) {
  recorder = minim.createRecorder(in, "/data/Custom"+n+".wav");
}

void startRecording() {
  recorder.beginRecord();
  recorderTimer=0; 
  println("BeginRecording");
}

void saveRecord() {
  recorder.save();
  recorder.endRecord();
  println("Done saveing.");
  setPlaylist(2);
}

void Record1() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorder(1);
    startRecording();
  }
}

void Record2() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorder(2);
    startRecording();
  }
}

void Record3() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorder(3);
    startRecording();
  }
}

void Record4() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorder(4);
    startRecording();
  }
}

void Record5() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorder(5);
    startRecording();
  }
}

void Record6() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorder(6);
    startRecording();
  }
}

void Record7() {
  if ( recorder.isRecording() ) saveRecord();
  else {
    setupRecorder(7);
    startRecording();
  }
}
