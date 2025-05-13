import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learn_programtion/learn_app.dart';
import 'core/DI/dependency_injection.dart';
import 'core/helper/sherdPrefernce.dart';

bool LoginUser = false;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await checkIfLoginUser();
  setupGetIt();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(LearnApp());
}

checkIfLoginUser() async {
  String? token = await SharedPrefHelper.getString('token');
  if (token != null && token.isNotEmpty) {
    LoginUser = true;
  } else {
    LoginUser = false;
  }

  print(LoginUser);
}
