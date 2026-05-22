import 'package:flutter/material.dart';
import '../servicios/api_service.dart';

class AdminScreen extends StatelessWidget {
  AdminScreen({super.key});
  
  final tTitulo = TextEditingController();
  final tAnio = TextEditingController();
  final tDirector = TextEditingController();
  final tGenero = TextEditingController();
  final tSinopsis = TextEditingController();
  final tImagen = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Administración de Catálogo')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(controller: tTitulo, decoration: const InputDecoration(labelText: 'Título')),
            TextField(controller: tAnio, decoration: const InputDecoration(labelText: 'Año')),
            TextField(controller: tDirector, decoration: const InputDecoration(labelText: 'Director')),
            TextField(controller: tGenero, decoration: const InputDecoration(labelText: 'Género')),
            TextField(controller: tSinopsis, decoration: const InputDecoration(labelText: 'Sinopsis'), maxLines: 3),
            TextField(controller: tImagen, decoration: const InputDecoration(labelText: 'URL de la Imagen')),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                await ApiService.guardar({
                  'titulo': tTitulo.text,
                  'anio': tAnio.text,
                  'director': tDirector.text,
                  'genero': tGenero.text,
                  'sinopsis': tSinopsis.text,
                  'imagen': tImagen.text,
                });
                if (context.mounted) Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
              child: const Text('GUARDAR PELÍCULA'),
            ),
          ],
        ),
      ),
    );
  }
}