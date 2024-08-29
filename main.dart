import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/full_app/todo/bloc.dart';
import 'package:todo_app/full_app/todo/dbhelper.dart';
import 'package:todo_app/full_app/default/home.dart';
import 'package:todo_app/full_app/default/profile.dart';
import 'package:todo_app/full_app/default/sign.dart';
import 'package:todo_app/full_app/user/bloc.dart';
import 'package:todo_app/full_app/user/sign.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/full_app/todo/state.dart';
import 'package:todo_app/full_app/todo/ui.dart';

/*
// this works in sign up without bloc add and update only
 void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check if the user is logged in
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  MyApp({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: isLoggedIn ? HomeScreen123() : SignUpScreen(),
      routes: {
        '/home': (context) => HomeScreen123(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
} */

/* void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check if the user is logged in
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: isLoggedIn ? const HomeScreen123() : SignUpScreen(),
        routes: {
          '/home': (context) => const HomeScreen123(),
          '/profile': (context) => ProfileScreen(),
        },
      ),
    );
  }
} */

/* void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(),
      child: MaterialApp(
        title: 'Flutter User App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SignUpScreen(),
          '/home': (context) => HomeScreen123(),
          '/profile': (context) => ProfileScreen(),
        },
      ),
    );
  }
} */

//works with bloc and model only
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Check if the user is logged in
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isLoggedIn = prefs.getBool('isLoggedIn') ?? false;

  final dbHelper = DatabaseHelper.instance;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (BuildContext context) => UserBloc(),
        ),
        BlocProvider<TodoBloc>(
          create: (BuildContext context) => TodoBloc(dbHelper),
        ),
      ],
      child: MaterialApp(
        home: isLoggedIn ? const HomeScreen123() : SignUpScreen(),
      ),
    ),
  );
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        Navigator.push(
            context, MaterialPageRoute(builder: (builder) => SignUpScreen()));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Image.asset('assets/img/todo.png'),
        ),
      ),
    );
  }
}
