import 'package:flutter/material.dart';
import 'package:flutter_authorization/authorization/ui/ui.dart';
import 'package:flutter_authorization/common/db.dart';
import 'package:flutter_authorization/resources/app_colors.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

 main() async {
  await Hive.initFlutter();
  await Hive.openBox(AppStorageHive.hiveBoxKey);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: AppColors.primary,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        backgroundColor: AppColors.background,
        scaffoldBackgroundColor: AppColors.background
      ),
      home: AuthorizationPage(),
    );
  }
}
