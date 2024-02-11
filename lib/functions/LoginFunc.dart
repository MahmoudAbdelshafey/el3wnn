import 'package:image_picker/image_picker.dart';

LoginFunc(String email, String passs){
  List<String> emails = ["mahmoud.abdelshafey@stemluxor.moe.edu.eg", "ahmed1@gmail.com","admin@gmail.com"];
  List<String> pass = ["12345678", "ahmed1234","admin@1234"];
  for(int i =0; i<emails.length; i++){
    if(email == emails[i]){
      if(passs == pass[i]){
        return true;
      }
    }
  }
  return false;
}


