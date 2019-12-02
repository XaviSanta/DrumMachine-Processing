//String[] buttonsFile = loadStrings("");

void keyPressed() {
  getButtonsFromFile(); 
}

void saveButtonsToFile() {
  String listButtonsClicked = "";
  for(StepButton sb : sBList) {
   if(sb.isClicked){
     listButtonsClicked += " " + sb.id;
   }
  }
  
  String[] splitedList = split(listButtonsClicked, ' ');
  saveStrings("SavedButtons.txt", splitedList);
   
}

void getButtonsFromFile() {
   String[] idButtons = loadStrings("SavedButtons.txt");
   for(int i = 1; i < idButtons.length; i++) {
     println(idButtons[i]);
     sBList.get(Integer.parseInt(idButtons[i])).activate();
   }
}
