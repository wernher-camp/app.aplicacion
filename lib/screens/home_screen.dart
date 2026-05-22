import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.movie_filter, size: 100, color: Colors.indigo),
            const Text('¡BIENVENIDO!', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/catalogo'),
              child: const Text('INGRESAR AL CATÁLOGO'),
            ),
            TextButton(
             onPressed: () => Navigator.pushNamed(context, '/registro'), 
              child: const Text('¿No tienes cuenta? Regístrate aquí'),
            ),
            const Divider(),
            ElevatedButton.icon(
              icon: const Icon(Icons.settings),
              label: const Text('ADMINISTRACIÓNss'),
              onPressed: () => Navigator.pushNamed(context, '/admin'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}