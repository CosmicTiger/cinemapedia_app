import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String movieDBAPIKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No API Key';
  static bool isDebugModeOn =
      bool.fromEnvironment('DEBUG', defaultValue: false);
}
