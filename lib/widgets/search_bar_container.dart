import 'package:assignment_course/widgets/profile_avater.dart';
import 'package:flutter/material.dart';
import '../model/models.dart';

class SearchBarContainer extends StatelessWidget {
  final User currentUser;
  const SearchBarContainer({super.key, required this.currentUser});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 12.0),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              width: 300,
              height: 30,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[100]),
              child: const TextField(
                  decoration: InputDecoration.collapsed(
                hintText: '... أنشر دعاء',
              ))),
          const SizedBox(
            width: 10.0,
          ),
          ProfileAvater(imageUrl: currentUser.imageUrl),
        ],
      ),
    );
  }
}
