//String[] buttonsFile = loadStrings("");

void saveButtonsToFile() {
  String listButtonsClicked = "";
   for(StepButton sb : sBList) {
       if(sb.isClicked){
         listButtonsClicked += "\n" + sb.id;
       }
   }
}
