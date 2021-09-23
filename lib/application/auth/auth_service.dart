import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

//prover um serviço constante, não sendo destruído no ciclo de vida
class AuthService extends GetxService {
  //guardar objetos
  User? user;

  void init() {
    //esculta as alterações no firebase
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      this.user = user;
      if (user == null) {
        Get.offAllNamed('/login');
      } else {
        Get.offAllNamed('/home');
      }
    });
  }
}
