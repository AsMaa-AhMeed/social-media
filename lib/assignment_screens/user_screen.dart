import 'package:assignment_course/model/user_repo_model.dart';
import 'package:assignment_course/reposertory/user_repository.dart';
import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  final String userName;
  final int userId;
  const UserScreen({super.key, required this.userName, required this.userId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xffFF6E3F),
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          title: Padding(
            padding: const EdgeInsets.only(left: 90.0),
            child: Text(userName,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
          )),
      body: FutureBuilder<UserRepoModel>(
          future: UserRepository().getUserData(userId),
          builder: (context, snapshot) {
            final userData = snapshot.data;
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView(
                children: [
                  Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            width: double.infinity,
                            child: Image.network(userData!.avatar,
                                height: 350, fit: BoxFit.cover)),
                        const SizedBox(height: 20),
                        customContainer('name', userData.name),
                        customContainer('role', userData.role),
                        customContainer('email', userData.email),
                        customContainer('creation at', userData.creationAt),
                        customContainer('update at', userData.updatedAt),
                      ])
                ],
              );
            }
            return const Text('Try Again Later!');
          }),
    );
  }

  customContainer(String title, String subTitle) {
    return Container(
        margin: const EdgeInsets.fromLTRB(14, 0, 14, 10),
        padding: const EdgeInsets.all(18),
        width: double.infinity,
        color: const Color(0xffFBE9E7),
        height: 60,
        child: Text('$title : $subTitle',
            style: const TextStyle(
                color: Color(0xffDF653D),
                fontSize: 18,
                fontWeight: FontWeight.bold)));
  }
}
