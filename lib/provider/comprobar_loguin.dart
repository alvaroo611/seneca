import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:seneca/widgets/class/user.dart';
import 'package:seneca/provider/utils/get_response.dart';
import 'package:provider/provider.dart';

class AppProvider extends ChangeNotifier {
  String user = "";
  String password = "";
  final getUser = GetResponse();

  Future<bool> compruebaUsuarioList() async {
    List<UserProvider> userList = await GetResponse().getResponse();
    FirebaseAuth auth = FirebaseAuth.instance;

    for (UserProvider user in userList) {
      if (user.email == auth.currentUser?.email) {
        return true;
      }
    }

    return false;
  }
}
