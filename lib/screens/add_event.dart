import 'dart:io';
import 'package:art_events/widgets/button_create.dart';
import 'package:art_events/widgets/header.dart';
import 'package:art_events/widgets/progress.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:image/image.dart' as Im;
import 'package:art_events/screens/home_screen.dart';
import 'dart:async';

/*
* Classe qui gère l'ajout d'évenement 
*/
class AddEventScreen extends StatefulWidget {
  static const routeName = '/add_event';

  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEventScreen> {

  bool isUploading = false;
  String eventId = Uuid().v4();
  File ? file;
  TextEditingController eventNameController = TextEditingController();
  TextEditingController eventLocationController = TextEditingController();
  TextEditingController eventDateController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  String selectedTime = "10:00";

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));

    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Future<void>_selectTime(BuildContext context) async {
    final TimeOfDay ? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if(time != null && time != selectedTime)
      setState((){
        selectedTime = time.format(context);
      });
  }


  @override
  void initState() {
    super.initState();
  }

  compressImage() async {
    final tempDir = await getTemporaryDirectory();
    final path = tempDir.path;
    Im.Image? imageFile = Im.decodeImage(file!.readAsBytesSync());
    final compressedImageFile = File('$path/img_$eventId.jpg')
      ..writeAsBytesSync(Im.encodeJpg(imageFile!, quality: 85));
    setState(() {
      file = compressedImageFile;
    });
  }

  Future<String> uploadImage(imageFile) async {
    firebase_storage.UploadTask uploadTask =
    storageRef.child("post_$eventId.jpg").putFile(imageFile);
    firebase_storage.TaskSnapshot storageSnap = await uploadTask.whenComplete(() => null);
    String downloadUrl = await storageSnap.ref.getDownloadURL();
    return downloadUrl;
  }

  createPostInFirestore(
      {required String mediaUrl, required String eventName, required String location,
  required DateTime dateTime, required String hour}) {
    eventsRef
       .add({
      "date" : dateTime,
      "hour" : hour,
      "image" : mediaUrl,
      "name" : eventName,
      "place" : location,
      "responsable": "managertest",
      "participants" : null,

    });
  }

  clearImage() {
    setState(() {
      file = null;
    });
  }


  handleSubmit() async {
    setState(() {
      isUploading = true;
    });

    await compressImage();

    print(selectedTime);

    String mediaUrl = await uploadImage(file);
    createPostInFirestore(
      mediaUrl: mediaUrl,
      eventName: eventNameController.text,
      location: eventLocationController.text,
      dateTime: selectedDate,
      hour: selectedTime,
    );
    eventNameController.clear();
    eventLocationController.clear();
    selectedDate = DateTime.now();
    selectedTime = "10:00";
    setState(() {
      file = null;
      isUploading = false;
      eventId = Uuid().v4();
    });
  }

  handleChooseFromGallery() async {
    Navigator.pop(context);
    File file = File(await ImagePicker().pickImage(source: ImageSource.gallery).then((pickedFile) => pickedFile!.path));
  //  File file = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      this.file = file;
    });
  }

 /* handleTakePhoto() async {
    Navigator.pop(context);
    File file = File(await ImagePicker().getImage(source: ImageSource.camera).then((pickedFile) => pickedFile!.path),
      maxHeight: 675,
      maxWidth: 960,);
    File file = await ImagePicker.pickImage(
      source: ImageSource.camera,
      maxHeight: 675,
      maxWidth: 960,
    );
    setState(() {
      this.file = file;
    });
  } */


  selectImage(parentContext) {
    return showDialog(
        context: parentContext,
        builder: (context) {
          return SimpleDialog(
            title: Text("Choisissez l'image de votre événement"),
            children: <Widget>[
             /* SimpleDialogOption(
                  child: Text("Photo with Camera"), onPressed: handleTakePhoto),*/
              SimpleDialogOption(
                  child: Text("Image de votre galerie"),
                  onPressed: handleChooseFromGallery),
              SimpleDialogOption(
                child: Text("Annuler"),
                onPressed: () => Navigator.pop(context),
              )
            ],
          );
        });
  }


  Container buildAddEventForm(){
    return Container(
      color: Theme.of(context).primaryColor,
      child: Scaffold(
        appBar:  header(context, titleText: "Ajout - Évènement") ,
        body: ListView(
          padding: EdgeInsets.all(30),
          children: <Widget>[
            isUploading ? linearProgress() : Text(""),
            Text(
              "Entrez les informations pour votre évènement d'art",
              style: TextStyle(
                fontFamily: "Raleway-Regular",
                fontSize: 30.0,
                color: Theme.of(context).backgroundColor,
              ),
            ),
            TextFormField(
              controller: eventNameController,
              decoration: InputDecoration(
                labelText: "Nom de l'exposition",
                labelStyle: TextStyle(
                  fontFamily: "Raleway-Regular",
                  fontSize: 14.0,
                  color: Theme.of(context).backgroundColor,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
              textInputAction: TextInputAction.next,
              cursorColor: Theme.of(context).backgroundColor,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: eventLocationController,
              decoration: InputDecoration(
                labelText: "Lieu de l'évènement",
                labelStyle: TextStyle(
                  fontFamily: "Raleway-Regular",
                  fontSize: 14.0,
                  color: Theme.of(context).backgroundColor,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                ),
              ),
              textInputAction: TextInputAction.next,
              cursorColor: Theme.of(context).backgroundColor,
            ),
            SizedBox(
              height: 20,
            ),
            Text("${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(
                fontFamily: "Raleway-Regular",
                fontSize: 15.0,
                color: Theme.of(context).backgroundColor,
              ),
            ),
            SizedBox(height: 20.0,),
            CustomButton(
               () => _selectDate(context),
              'Choisissez la date'),
            CustomButton(
                () => _selectTime(context), "Choisissez l'heure",
            ),
            SizedBox(
              height: 20,
            ),
           CustomButton(() => isUploading ? null : selectImage(context), 'Ajouter une image'),
          ],
        ),
      ),
    );
  }

  Scaffold buildAddEventWithImageForm(){
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: header(context, titleText: "Ajout"),
      body: ListView(
        children: <Widget>[
          isUploading ? linearProgress() : Text(""),
          Container(
            height: 220.0,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Center(
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(file!),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0),
          ),
          CustomButton(() => isUploading ? null : handleSubmit(), 'CRÉER'),
        ],

      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return file==null ? buildAddEventForm() : buildAddEventWithImageForm();
  }
}
