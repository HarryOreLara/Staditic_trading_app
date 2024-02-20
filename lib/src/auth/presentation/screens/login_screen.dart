import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:staditic_trading_app/src/auth/presentation/presentacion.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final backgroudnScaffold = Theme.of(context).scaffoldBackgroundColor;
    return Scaffold(
      backgroundColor: backgroudnScaffold,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
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
                          image: AssetImage("assets/images/paris.jpg"),
                          alignment: Alignment.bottomCenter,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const LoginForm()
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginForm = ref.watch(loginFormProvider);

    ref.listen(authProvider, (previous, next) {
      if (next.errorMessage.isEmpty) return;
      showSnackbar(context, next.errorMessage);
    });

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
                  "Iniciar Sesión",
                  style: GoogleFonts.montserrat(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    context.push('/register');
                  },
                  child: Text("Registrarse",
                      style: GoogleFonts.montserrat(
                          fontSize: 15.0, color: const Color(0xFF00D0FF))),
                )
              ],
            ),
            const SizedBox(
              height: 5.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.alternate_email,
                    color: Color(0xFF00D0FF),
                  ),
                ),
                Expanded(
                    child: CustomAuthTextField(
                  hint: "Email",
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) =>
                      ref.read(loginFormProvider.notifier).onEmailChange(value),
                  errorMessage: !loginForm.isFormPosted
                      ? loginForm.email.errorMessage
                      : null,
                ))
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 16.0),
                  child: Icon(
                    Icons.lock,
                    color: Color(0xFF00D0FF),
                  ),
                ),
                Expanded(
                    child: CustomAuthTextField(
                  hint: "Password",
                  obscureText: true,
                  onFieldSubmitted: (_) =>
                      ref.read(loginFormProvider.notifier).onFormSubmit(),
                  onChanged: (value) => ref
                      .read(loginFormProvider.notifier)
                      .onPasswordChange(value),
                  errorMessage: !loginForm.isFormPosted
                      ? loginForm.password.errorMessage
                      : null,
                ))
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
                    loginForm.isPosting
                        ? null
                        : ref.read(loginFormProvider.notifier).onFormSubmit;
                  },
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFF00D0FF)),
                    child: const Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromARGB(255, 255, 255, 255),
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
