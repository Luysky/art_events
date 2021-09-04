import 'dart:io';

import 'package:art_events/models/user.dart';
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

class AddEventScreen extends StatefulWidget {
  static const routeName = '/add_event';

 /* final User currentUser;

  AddEventScreen({this.currentUser}); */


  @override
  _AddEventState createState() => _AddEventState();
}

class _AddEventState extends State<AddEventScreen> {

  bool isUploading = false;
  String eventId = Uuid().v4();
  File ? file;
  TextEditingController eventNameController = TextEditingController();


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
      {required String mediaUrl, required String eventName}) {
    eventsRef
       .add({
      "date" : DateTime.now(),
      "image" : mediaUrl,
      "name" : eventName,
      "place" : "Sion",
      "responsable": "managertest",

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

    String mediaUrl = await uploadImage(file);
    createPostInFirestore(
      mediaUrl: mediaUrl,
      eventName: eventNameController.text,
    );
    eventNameController.clear();
    setState(() {
      file = null;
      isUploading = false;
      eventId = Uuid().v4();
    });
  }

  handleChooseFromGallery() async {
    Navigator.pop(context);
    File file = File(await ImagePicker().getImage(source: ImageSource.gallery).then((pickedFile) => pickedFile!.path));
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
            title: Text("Choisissez l'image de votre evenement"),
            children: <Widget>[
             /* SimpleDialogOption(
                  child: Text("Photo with Camera"), onPressed: handleTakePhoto),*/
              SimpleDialogOption(
                  child: Text("Image de la Gallery"),
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
        body: Column(
          children: <Widget>[
            header(context, titleText: "Ajout"),
            isUploading ? linearProgress() : Text(""),
            TextFormField(
              controller: eventNameController,
              decoration: InputDecoration(
                labelText: 'Nom de l''exposition',
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
           CustomButton(() => isUploading ? null : selectImage(context), 'AJOUTER UNE IMAGE'),
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
