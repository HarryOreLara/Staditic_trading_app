import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staditic_trading_app/src/auth/presentation/presentacion.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/dragon.jpg"),
                          alignment: Alignment.bottomCenter,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const RegisterForm()
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends ConsumerWidget {
  const RegisterForm({super.key});

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      flex: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Registrate",
                  style: GoogleFonts.montserrat(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    context.pop(context);
                  },
                  child: Text("Iniciar Sesión",
                      style: GoogleFonts.montserrat(
                          fontSize: 15.0, color: const Color(0xFFF72121))),
                )
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.alternate_email,
                    color: Color(0xFFF72121),
                  ),
                ),
                Expanded(child: CustomAuthTextField())
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.lock,
                    color: Color(0xFFF72121),
                  ),
                ),
                Expanded(child: CustomAuthTextField())
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Center(
              child: Text(
                "- OR -",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 17.0,
                      child: Image.asset("assets/images/google.jpg",
                          fit: BoxFit.cover, scale: 5),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 17.0,
                        child: Image.asset("assets/images/facebook.jpg")),
                    const SizedBox(
                      width: 20.0,
                    ),
                    CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 17.0,
                        child: Image.asset("assets/images/ios.jpg")),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    // loginForm.isPosting
                    //     ? null
                    //     : ref.read(loginProvider.notifier).onFormSubmit;
                    print("register");
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFF72121)),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color(0xFF202020),
                      size: 20.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            GestureDetector(
                onTap: () {},
                child: const Text(
                  "Olvido su contraseña?",
                  style: TextStyle(color: Colors.grey),
                )),
          ],
        ),
      ),
    );
  }
}
