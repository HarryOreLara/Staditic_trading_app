import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  static initEnviroment() async {
    await dotenv.load(fileName: ".env");
  }

  static String apiUrlAuth = dotenv.env['API_AUTH__URL'] ?? 'No esta configurado';
}
