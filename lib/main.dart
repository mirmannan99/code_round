import 'package:code_round/features/home/view_model/home_view_model.dart';
import 'package:code_round/features/signup/view_model/signup_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'features/signup/view/signup_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SignUpViewModel>(
            create: (_) => SignUpViewModel()),
        ChangeNotifierProvider<HomeViewModel>(create: (_) => HomeViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignUpScreen(),
      ),
    );
  }
}
