import 'package:cart_animation/State%20Management/Tag_cubit/tag_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Screens/home/home_screen.dart';
import 'constants.dart';

void main() {

  runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create:(context)=>TagCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(defaultPadding * 0.75),
              shape: StadiumBorder(),
              backgroundColor: primaryColor,
            ),
          ),
        ),
        home: HomeScreen(),
      ),
    );
  }
}
