
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as FirebaseStorage ;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import '../../constants/size_config.dart';
import '../../constants/styles.dart';
import '../../core/mainwidgets/generalTextField.dart';
import '../../core/mainwidgets/onboarding_getStartedBtn.dart';

class reportmissingsend extends StatefulWidget {
   reportmissingsend({super.key});
  @override
  State<reportmissingsend> createState() => _reportmissingsendState();
}

class _reportmissingsendState extends State<reportmissingsend> {
  late var _image;
  CollectionReference Datas = FirebaseFirestore.instance.collection('Data');
  final TextEditingController _controller = TextEditingController();
  TextEditingController Details = TextEditingController();
  GlobalKey<FormState> FormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var Image;
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    List<String> countries = [
      'Macca',
      'ElMadina',
    ];
    var picked;

    String suggestionname = "Lost in...";
    var _selectedImagge;
    return  Scaffold(
      appBar: AppBar(title: Text("Report A Missing",style: kBodyText1,),centerTitle: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                width:sizeH*100 ,
                height:sizeV *20 ,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        kMainButColor,
                        kSecondryColor,
                        kSecondryColor
                      ],
                    )              ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text("Al3wn application\n "
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  textAlign: TextAlign.center,
                  style: kBodyText1.copyWith(color: Colors.white,
                  fontSize: 14),),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("More Information",style: kBodyText1,),
            ),
            SizedBox(height:sizeV ,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("More Information about the missing",style: kBodyText1.copyWith(fontSize: 16),),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: FormKey,
                child: TextFormField(
                  controller: Details,
                  obscureText: false ,
                  keyboardType: TextInputType.multiline,
                  maxLines: 5,
                  decoration: InputDecoration(


                    hintText: "details",
                    labelStyle: TextStyle(color: kTextboxColor),

                    hintStyle: TextStyle(color: Colors.black12),
                    enabledBorder:
                    OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: kTextboxColor)
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: kTextboxColor)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6),
                        borderSide: BorderSide(color: kTextboxColor)
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text("Photo of the Missing",style: kBodyText1,),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: sizeH*25,
                height: sizeV*6,
                decoration: BoxDecoration(
                  color: kSecondryColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: GestureDetector(onTap: _pickImageFromGallery,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.cloud_upload,color: kSecondryColor,),
                      Text("Upload",style: kBodyText1.copyWith(color: kSecondryColor, fontSize: 12)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
              child:               TypeAheadField(
                textFieldConfiguration: TextFieldConfiguration(
                  autofocus: false,
                  controller: _controller,
                  decoration: InputDecoration(


                  hintText: suggestionname,
                  labelStyle: TextStyle(color: kTextboxColor),

                  hintStyle: TextStyle(color: Colors.black12),
                  enabledBorder:
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: kTextboxColor)
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: kTextboxColor)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                      borderSide: BorderSide(color: kTextboxColor)
                  ),
                ),
                ),
                suggestionsCallback: (pattern) {
                  return countries
                      .where((country) => country.toLowerCase().contains(pattern.toLowerCase()))
                      .toList();
                },
                itemBuilder: (context, suggestion) {
                  return ListTile(
                    title: Text(suggestion),
                  );
                },
                onSuggestionSelected: (suggestion) {

                  _controller.text = suggestion;
                  setState(() {
                    suggestionname = suggestion;
                    SizeConfig.place = suggestion;

                  });
                },
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: onboarding_getStartedBtn(onPressed: (){
                upload();
                AddData( );

                Navigator.pop(context);
              },bgColor: kMainButColor,buttonName: "Send"),
            ),


          ],
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async{
   final  returnedImage = await ImagePicker().pickImage(source: ImageSource.gallery);

setState(() {
  _image = File(returnedImage!.path);
});
  }
  void upload()async{
    String fileName = DateTime.now().microsecondsSinceEpoch.toString();
    FirebaseStorage.Reference referenceStorage = FirebaseStorage.FirebaseStorage.instance.ref().child("Images").child(fileName+'.jpg');
  FirebaseStorage.UploadTask taskUpload = referenceStorage.putFile(File(_image!.path));

  FirebaseStorage.TaskSnapshot snapshotTask = await taskUpload.whenComplete(() => {});
  await snapshotTask.ref.getDownloadURL().then((value) => {
    SizeConfig.Image = value.toString()
  });

  }
  Future<void> AddData() {
    print(SizeConfig.Image);

    return Datas
        .add({
      'Description': Details.text.toString(),
      'Image': SizeConfig.Image,
      'LostIn': SizeConfig.place ,
      'email': SizeConfig.Email ,
      'Step' : "Frist"
    })
        .then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Report Sent Successfully"))))
        .catchError((error) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error.toString()))));
  }
}
