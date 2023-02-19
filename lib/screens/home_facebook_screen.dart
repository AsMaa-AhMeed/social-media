import 'package:assignment_course/model/models.dart';
import 'package:assignment_course/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

class HomeFacebookScreen extends StatelessWidget {
  const HomeFacebookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(scrollDirection: Axis.vertical, children: [
        Column(
          children: [
            SearchBarContainer(currentUser: currentUser),
            const SizedBox(height: 15.0),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final Post post = posts[index];
                return PostContainer(post: post);
              },
            ),
          ],
        )
      ]),
    );
  }
}
