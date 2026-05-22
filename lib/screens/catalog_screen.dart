import 'package:flutter/material.dart';
import '../servicios/api_service.dart';
import 'details_screen.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Películas Disponibles')),
      body: FutureBuilder(
        future: ApiService.obtenerPeliculas(),
        builder: (context, AsyncSnapshot snapshot) {
          if (!snapshot.hasData) return const Center(child: CircularProgressIndicator());
          
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, i) {
              var peli = snapshot.data[i];
              String img = peli['imagen'] ?? '';
              return ListTile(
                leading: img.isEmpty 
                  ? const Icon(Icons.movie) 
                  : Image.network(img, width: 50, errorBuilder: (c,e,s) => const Icon(Icons.movie)),
                title: Text(peli['titulo'] ?? 'Sin título'),
                subtitle: Text(peli['director'] ?? 'Director desconocido'),
                onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (c) => DetailsScreen(datos: peli)
                )),
              );
            },
          );
        },
      ),
    );
  }
}