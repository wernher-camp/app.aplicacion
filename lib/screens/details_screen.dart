import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final Map datos;
  const DetailsScreen({super.key, required this.datos});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(datos['titulo'] ?? 'Detalle')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(datos['imagen'] ?? '', height: 300, errorBuilder: (c,e,s) => const Icon(Icons.broken_image, size: 100))),
            const SizedBox(height: 20),
            Text(datos['titulo'] ?? 'Sin título', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('Año: ${datos['anio'] ?? 'N/A'} | Género: ${datos['genero'] ?? 'N/A'}'),
            const SizedBox(height: 10),
            Text('Director: ${datos['director'] ?? 'Desconocido'}', style: const TextStyle(fontStyle: FontStyle.italic)),
            const Divider(),
            const Text('Sinopsis:', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(datos['sinopsis'] ?? 'No hay descripción disponible para esta película.'),
          ],
        ),
      ),
    );
  }
}