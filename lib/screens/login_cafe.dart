import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';

class LoginCafeScreen extends StatelessWidget {
  final Color colorPlomo = Colors.grey;

  const LoginCafeScreen({super.key});

  // Método para mostrar diálogo en Android
  void displayDialogAndroid(BuildContext context, String title, String content) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: Colors.brown.shade50, // Color de fondo
        title: Text(
          title,
          style: TextStyle(
            color: Colors.brown.shade900, 
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              content,
              style: TextStyle(color: Colors.brown.shade800),
            ),
            const SizedBox(height: 10),
            Icon(
              Icons.coffee,
              size: 50,
              color: Colors.brown.shade600,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancelar', 
              style: TextStyle(fontSize: 18, color: Colors.brown),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Aceptar', 
              style: TextStyle(fontSize: 18, color: Colors.brown),
            ),
          ),
        ],
      ),
    );
  }

  // Método para mostrar diálogo en iOS
  void displayDialogIOS(BuildContext context, String title, String content) {
    showDialog(
      barrierDismissible: true,
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.brown.shade900,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                content,
                style: TextStyle(color: Colors.brown.shade800),
              ),
              const SizedBox(height: 15),
              const FlutterLogo(size: 80),
            ],
          ),
          actions: [
            CupertinoDialogAction(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Aceptar',
                style: TextStyle(color: Colors.brown),
              ),
            ),
          ],
        );
      },
    );
  }

  // Método para manejar alertas según el sistema operativo
  void showAlert(BuildContext context, String title, String content) {
    if (Platform.isAndroid) {
      displayDialogAndroid(context, title, content);
    } else {
      displayDialogIOS(context, title, content);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cafe',
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Nuestro mejor café del mundo',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Image.asset('assets/cafe.gif'), // Asegúrate de colocar un GIF en assets
            Column(
              children: [
                ElevatedButton(
                  onPressed: () => showAlert(
                    context,
                    'Iniciar Sesión',
                    'Bienvenido, esta es la pantalla de inicio de sesión',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.brown,
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Iniciar Sesión',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => showAlert(
                    context,
                    'Registrarte',
                    'Por favor, regístrate para continuar',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    side: const BorderSide(color: Colors.brown),
                    padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    minimumSize: const Size(double.infinity, 50),
                  ),
                  child: const Text(
                    'Registrarte',
                    style: TextStyle(color: Colors.brown),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
