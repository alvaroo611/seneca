import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:seneca/widgets/exportWidget.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});
   Future<User?> _getCurrentUser() async {
    final User? user = FirebaseAuth.instance.currentUser;
    if (user != null && !user.isAnonymous) {
      return user;
    } else {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signInSilently();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);
        return userCredential.user;
      }
    }
    return null;
   }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              child: Stack(
                children: [
                  Background(),
                  Positioned(
                    top: 0, // Ajusta la posición vertical según tus necesidades
                    left:
                        0, // Ajusta la posición horizontal según tus necesidades
                    right: 0,
                    child: Center(
                      child: Text(
                        'ISéneca', // Texto a centrar
                        style: TextStyle(
                          fontSize: 24, // Tamaño del texto
                          color: Colors.white, // Color del texto
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            FutureBuilder<User?>(
              future: _getCurrentUser(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final String userName =
                      snapshot.data?.displayName ?? 'Usuario';
                  return Container(
                    padding: const EdgeInsets.all(16),
                    color: Colors.white,
                    child: Text(
                      '¡Hola, $userName!',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }
              },
            ),
            Positioned(
              // Ancho completo de la pantalla
              child: SafeArea(
                child: Container(
                  color: Colors.white,
                  height: size.height * 0.5, // Ajusta la altura del Container
                  width: size.width, // Ancho completo de la pantalla
                  child: Align(
                    alignment:
                        Alignment.center, // Centra el contenido verticalmente
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                             SizedBox(
                              width: size.width*0.1,
                            ),
                            _buildImageWithText(
                              'assets/sombrero.png',
                              'Alumnado del centro',
                            ),
                          SizedBox(
                              width: size.width*0.1,
                            ),
                            _buildImageWithText(
                              'assets/profesor.png',
                              'Personal del centro',
                            ),
                            SizedBox(
                              width: size.width*0.05,
                            ),
                            _buildImageWithText(
                              'assets/covid.png',
                              'Información Covid',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                             SizedBox(
                              width: size.width*0.1,
                              height: size.height*0.2,
                            ),
                           _buildImageWithText(
                                'assets/campana.png',
                                'Tablón de anuncios',
                              ),
                             SizedBox(
                              width: size.width*0.1,
                              height: size.height*0.2,
                            ),
                            
                               _buildImageWithText(
                                'assets/calendario.png',
                                'Calendario escolar',
                              ),
                            
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white, // Fondo de la barra de iconos
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconItem(
                        icon: Icons.home,
                        label: 'Inicio',
                        labelColor: Colors.grey,
                        iconColor: Colors.blue,
                        
                      ),
                      IconItem(
                        icon: Icons.access_time_sharp,
                        label: 'Agenda',
                        labelColor: Colors.grey,
                        iconColor: Colors.grey,
                      ),
                      IconItem(
                        icon: Icons.mode_comment_outlined,
                        label: 'Comunicaciones',
                        labelColor: Colors.grey,
                        iconColor: Colors.grey,
                      ),
                      IconItem(
                        icon: Icons.menu,
                        label: 'Menú',
                        labelColor: Colors.grey,
                        iconColor: Colors.grey,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImageWithText(String imagePath, String text) {
    return Container(
      padding: const EdgeInsets.all(0), // Agrega un padding

      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 50,
            width: 50,
          ),
          Text(
            text,
            style: const TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
class IconItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color labelColor;
  final Color iconColor;

  IconItem({
    required this.icon,
    required this.label,
    required this.labelColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: iconColor, // Usar el color definido para el icono
          size: 24,
        ),
        Text(
          label,
          style: TextStyle(
            color: labelColor,
          ),
        ),
      ],
    );
  }
}
