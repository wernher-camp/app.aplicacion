import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Agregado
import 'screens/home_screen.dart';
import 'screens/catalog_screen.dart';
import 'screens/admin_screen.dart';
import 'screens/register_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/registro': (context) => const RegisterScreen(),
        '/catalogo': (context) => const CatalogScreen(),
        '/admin': (context) => AdminScreen(), 
      },
    );
  }
}