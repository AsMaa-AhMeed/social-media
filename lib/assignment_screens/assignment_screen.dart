import 'package:assignment_course/widgets/custom_button.dart';
import 'package:assignment_course/model/user_repo_model.dart';
import 'package:assignment_course/reposertory/user_repository.dart';
import 'package:assignment_course/assignment_screens/user_screen.dart';
import 'package:flutter/material.dart';

class AssignmentScreen extends StatelessWidget {
  const AssignmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffFF6E3F),
          centerTitle: true,
          title: const Text('Users Page',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold)),
        ),
        body: FutureBuilder<List<UserRepoModel>>(
            future: UserRepository().getAllUsers(),
            builder: (context, snapshot) {
              final listOfUsers = snapshot.data;
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.connectionState == ConnectionState.done) {
                return userSection(listOfUsers!);
              }
              return const Text('Try Again Later!');
            }));
  }

  userSection(List<UserRepoModel> listName) {
    return GridView.builder(
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            //  childAspectRatio: .72,
            childAspectRatio: 3 / 4.4,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20
            // childAspectRatio: MediaQuery.of(context).size.width /
            //     (MediaQuery.of(context).size.height / 1.5),
            ),
        scrollDirection: Axis.vertical,
        itemCount: listName.length,
        itemBuilder: ((context, index) {
          return InkWell(
              onTap: (() {
                int userId = listName[index].id;
                Navigator.of(context).push(MaterialPageRoute(
                    builder: ((context) => UserScreen(
                          userName: listName[index].name,
                          userId: userId,
                        ))));
              }),
              child: Container(
                  margin: const EdgeInsets.all(8),
                  child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(14)),
                          border: Border.all(
                              color: const Color(0xffFF6E3F), width: .5)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                                child: Image.network(listName[index].avatar,
                                    width: 180,
                                    height: 160,
                                    fit: BoxFit.cover)),
                            CustomButton(
                              data: listName[index].name,
                              onPressed: () {},
                            )
                          ]))));
        }));
  }
}
