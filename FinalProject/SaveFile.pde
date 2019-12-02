void saveButtonsToFile() {
  String listButtonsClicked = "";
  for(StepButton sb : sBList) {
   if(sb.isClicked){
     listButtonsClicked += " " + sb.id;
   }
  }
  println("ASDF");
  
  String[] splitedList = split(listButtonsClicked, ' ');
  saveStrings("/savedButtons/SavedButtons2.txt", splitedList);
}

void activateButtonsFromFile(int n) {
  Clear();
  String[] idButtons = loadStrings("/savedButtons/SavedButtons" + n + ".txt");
  for(int i = 1; i < idButtons.length; i++) {
    sBList.get(Integer.parseInt(idButtons[i])).activate();
  }
}

void DDButtonsFile(int n) {
  activateButtonsFromFile(n);
}
