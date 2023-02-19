import 'package:assignment_course/model/user_repo_model.dart';
import 'package:dio/dio.dart';

class UserRepository {
  Future<List<UserRepoModel>> getAllUsers() async {
    final response = await Dio().get('https://api.escuelajs.co/api/v1/users');
    List<UserRepoModel> listOfUserModel =
        List<UserRepoModel>.from(response.data.map((element) {
      return UserRepoModel(
          id: element['id'],
          email: element['email'],
          password: element['password'],
          name: element['name'],
          role: element['role'],
          avatar: element['avatar'],
          creationAt: element['creationAt'],
          updatedAt: element['updatedAt']);
    }));

    return listOfUserModel;
  }

  Future<UserRepoModel> getUserData(int userId) async {
    final response =
        await Dio().get('https://api.escuelajs.co/api/v1/users/$userId');
    final singleUserData = UserRepoModel.fromJson(response.data);
    return singleUserData;
  }
}
