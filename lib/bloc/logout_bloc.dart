import 'package:aplikasi_manajemenbuku/helper/user_info.dart';

class LogoutBloc {
  static Future logout() async {
    await UserInfo().logout();
  }
}
