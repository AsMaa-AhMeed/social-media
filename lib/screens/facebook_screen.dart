import 'dart:io';
import 'package:assignment_course/widgets/custom_text_form_feild.dart';
import 'package:assignment_course/manager/color_manager.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class FaceBookScreen extends StatefulWidget {
  const FaceBookScreen({super.key});

  @override
  State<FaceBookScreen> createState() => _FaceBookScreenState();
}

class _FaceBookScreenState extends State<FaceBookScreen> {
  DateTime? _myDateTime;
  String gender = 'Genger';
  String birthDate = 'Birth Date';
  File? file;
  XFile? _image;
  // DateTime today = DateTime.now();
  // void _onDaySelected(DateTime day, DateTime focusedDay) {
  //   setState(() {
  //     today = day;
  //   });
  // }

  Future _pickImage(bool imageFrom) async {
    try {
      _image = await ImagePicker().pickImage(
          source: imageFrom ? ImageSource.camera : ImageSource.gallery);

      if (_image != null) {
        final temporaryImage = File(_image!.path);
        setState(() {
          _image = temporaryImage as XFile?;
        });
      }

      // final image = await ImagePicker().pickImage(source: ImageSource.camera);
      // if (image == null) return;
      // final temporaryImage = File(image.path);
      // setState(() {
      //   this.image = temporaryImage;
      // });
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarColor: Colors.white,
              statusBarBrightness: Brightness.dark),
          toolbarHeight: 100,
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: const Text('Fill Your Profile',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'AbrilFatface',
              ))),
      body: ListView(children: [
        file != null
            ? CircleAvatar(
                backgroundColor: Colors.grey[100],
                radius: 80,
                backgroundImage: Image.file(file!).image)
            : _showCirclerImage(),
        Form(
          child: Column(
            children: [
              CustomTextField(
                hintText: 'First Name',
                inputType: TextInputType.name,
              ),
              CustomTextField(
                hintText: 'Last Name',
                inputType: TextInputType.name,
              ),
              CustomTextField(
                  hintText: birthDate,
                  inputType: TextInputType.datetime,
                  sufIcon: IconButton(
                    icon: const Icon(Icons.calendar_today_outlined),
                    iconSize: 18,
                    onPressed: () async {
                      _myDateTime = await showDatePicker(
                          context: context,
                          initialDate: _myDateTime == null
                              ? DateTime.now()
                              : _myDateTime!,
                          firstDate: DateTime(2010),
                          lastDate: DateTime(2025));
                      setState(() {
                        // final now = DateTime.now();
                        //     birthDate = _myDateTime.toString();
                        birthDate =
                            DateFormat('dd-MM-yyyy').format(_myDateTime!);
                      });
                    },
                  )),
              CustomTextField(
                  hintText: 'Email',
                  inputType: TextInputType.emailAddress,
                  sufIcon: const Icon(Icons.email)),
              CustomTextField(
                hintText: gender,
                sufIcon: PopupMenuButton(
                  icon: const Icon(Icons.arrow_drop_down_rounded),
                  iconSize: 40,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  itemBuilder: (context) {
                    return <PopupMenuEntry<String>>[
                      const PopupMenuItem(value: 'male', child: Text('Male')),
                      const PopupMenuItem(
                          value: 'female', child: Text('Female')),
                    ];
                  },
                  onSelected: (value) {
                    setState(() {
                      gender = value;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(20),
          child: ElevatedButton(
              onPressed: _uploadImage,
              style: ElevatedButton.styleFrom(
                  elevation: 4,
                  padding: const EdgeInsets.all(16),
                  shape: const StadiumBorder(),
                  disabledBackgroundColor: ColorManager.darkBlue,
                  disabledForegroundColor: ColorManager.white),
              child: const Text(
                'Continue',
                style: TextStyle(fontFamily: 'AbrilFatface', fontSize: 18),
              )),
        )
      ]),
    );
  }

  showImageSource(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera'),
              onTap: () {
                _pickImage(true);
                Navigator.pop(context);
              }),
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Gallery'),
            onTap: () {
              _pickImage(false);
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _showCirclerImage() {
    return Stack(alignment: Alignment.center, children: [
      CircleAvatar(
        backgroundColor: Colors.grey[100],
        radius: 80,
        child: Icon(Icons.person, size: 100, color: Colors.grey[300]),
      ),
      Positioned(
          right: 110,
          bottom: 10,
          child: IconButton(
              onPressed: () {
                showImageSource(context);
              },
              icon: buildCircle(
                all: 3,
                color: ColorManager.white,
                child: buildCircle(
                    child: const Icon(
                      Icons.edit,
                      color: ColorManager.white,
                      size: 20,
                    ),
                    all: 4,
                    color: ColorManager.lightBlue),
              )))
    ]);
  }

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
  // Container _calenderWidget() {
  //   return Container(
  //     decoration: BoxDecoration(
  //         color: const Color(0xffEEF4FF),
  //         borderRadius: BorderRadius.circular(20)),
  //     padding: const EdgeInsets.all(20),
  //     margin: const EdgeInsets.all(20),
  //     child: TableCalendar(
  //       firstDay: DateTime.utc(2010, 10, 10),
  //       focusedDay: today,
  //       lastDay: DateTime.utc(2030, 12, 30),
  //       locale: 'en_US',
  //       rowHeight: 40,
  //       headerStyle:
  //           const HeaderStyle(formatButtonVisible: false, titleCentered: true),
  //       availableGestures: AvailableGestures.all,
  //       onDaySelected: _onDaySelected,
  //       selectedDayPredicate: (day) => isSameDay(day, today),
  //     ),
  //   );
  // }

  void _uploadImage() async {
    try {
      firebase_storage.UploadTask uploadTask;
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('product')
          .child('/${_image!.name}');

      uploadTask = ref.putFile(File(_image!.path));
      await uploadTask.whenComplete(() => null);
      String imageUrl = await ref.getDownloadURL();
      print('Uploaded Image URL $imageUrl');
    } catch (e) {
      print('Error is :$e');
    }
  }
}
