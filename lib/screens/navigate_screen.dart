import 'package:assignment_course/manager/color_manager.dart';
import 'package:assignment_course/screens/home_facebook_screen.dart';
import 'package:assignment_course/screens/messages_screen.dart';
import 'package:assignment_course/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class NavigateScreen extends StatefulWidget {
  const NavigateScreen({super.key});

  State<NavigateScreen> createState() => _NavigateScreenState();
}

class _NavigateScreenState extends State<NavigateScreen> {
  int navigatIndex = 0;
  List items = const [
    MessagesScreen(),
    HomeFacebookScreen(),
    ProfileScreen(),
  ];
  List<String> itemsName = [
    'الرسائل',
    'الصفحة الرئيسية',
    'الصفحة الشخصية',
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          textAlign: TextAlign.center,
          itemsName[navigatIndex],
          style: const TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        leading: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            IconButton(
              icon: Icon(Icons.notifications_none,
                  color: Colors.grey[600], size: 28),
              onPressed: () {},
            ),
            Positioned(
                bottom: 35.0,
                right: 17.0,
                child: Container(
                  height: 10.0,
                  width: 10.0,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                ))
          ],
        ),
      ),
      body: items[navigatIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0.0,
          currentIndex: navigatIndex,
          onTap: ((int index) {
            setState(() {
              navigatIndex = index;
            });
          }),
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.email_outlined), label: 'الرسائل'),
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined), label: 'الصفحة الرئيسية'),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_outline), label: 'الصفحة الشخصية'),
          ]),
    );
  }
}
// ListTile(
//             title: Text(
//               textAlign: TextAlign.center,
//               itemsName[navigatIndex],
//               style: const TextStyle(
//                   color: Colors.black,
//                   fontSize: 24,
//                   fontWeight: FontWeight.bold),
//             ),
//             subtitle: Expanded(
//               child: Container(
//                 height: 60,
//                 padding: const EdgeInsets.all(10),
//                 child: TextField(
//                     decoration: InputDecoration(
//                         prefixIcon: Icon(Icons.search, color: Colors.grey),
//                         suffixIcon: Icon(Icons.mic, color: Colors.grey),
//                         hintText: 'Search',
//                         filled: true,
//                         fillColor: Colors.grey,
//                         focusColor: Colors.grey,
//                         enabledBorder: OutlineInputBorder(
//                           borderSide: BorderSide(color: Colors.grey),
//                           borderRadius: BorderRadius.all(Radius.circular(20)),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.grey),
//                             borderRadius:
//                                 BorderRadius.all(Radius.circular(20))))),
//               ),
//             )),