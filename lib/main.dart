import 'package:flutter/material.dart';
import 'package:myapp/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twitter Clone',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const TweetListScreen(),
    );
  }
}

class TweetListScreen extends StatelessWidget {
  const TweetListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(

        preferredSize: const Size.fromHeight(
            120.0), // Ajusta la altura según tus necesidades
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.black,
              centerTitle: false,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Icono de perfil
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'URL_DE_TU_IMAGEN_DE_PERFIL'), // Reemplaza con la URL de tu imagen de perfil
                  ),

                  // Logo de X
                  Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/5/57/X_logo_2023_%28white%29.png',
                    height: 30.0,
                  ),

                  // Rueda de ajustes
                  IconButton(
                    onPressed: () {}, // Acción al presionar la rueda de ajustes
                    icon: const Icon(Icons.settings, color: Colors.white),
                  ),
                ],
              ),
            ),

            // "For you" y "Following"
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(
                children: [
                  // Barra azul (inicialmente debajo de "For you")
                  Positioned(
                    bottom: 0,
                    left: 0, // Ajusta la posición inicial según tus necesidades
                    right: MediaQuery.of(context).size.width /
                        2, // La mitad del ancho de la pantalla
                    child: Container(
                      height: 4.0, // Ajusta la altura de la barra
                      color: Colors.blue,
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .spaceEvenly, // Distribuye los botones uniformemente
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            // Acción al presionar "For you"
                            // Mueve la barra azul debajo de "For you"
                          },
                          child: const Text('For you',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {
                            // Acción al presionar "Following"
                            // Mueve la barra azul debajo de "Following"
                          },
                          child: const Text('Following',
                              style: TextStyle(color: Colors.grey)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
          
        ),
        
      ),
      body: HomePage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Ensures all icons are visible
        backgroundColor: Colors.black, // Background color of the navbar
        selectedItemColor: Colors.blue, // Color of the selected icon
        unselectedItemColor: Colors.grey, // Color of unselected icons
        showSelectedLabels: false, // Hides labels for selected items
        showUnselectedLabels: false, // Hides labels for unselected items
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: 'Messages',
          ),
        ],
      ),
    );
  }
}

class TweetCard extends StatelessWidget {
  const TweetCard({super.key, required this.username, required this.text});

  final String username;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              username,
              style: const TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

// ... (Tweet class and other helper functions)
