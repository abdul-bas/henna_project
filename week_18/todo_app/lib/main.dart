import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/screens/home.dart';
import 'package:todo_app/state_management/api_service/api_bloc.dart';
import 'package:todo_app/state_management/home_view/bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  

  runApp(
    MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => BlocManagement(),
      ),
      BlocProvider(
        create: (context) => ApiBloc(),
      )
    ], child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: AppBarTheme(color: Colors.black)),
      home: HomeScreen(),
    );
  }
}
