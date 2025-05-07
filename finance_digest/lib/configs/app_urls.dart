import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppUrl {
  static String baseUrl = Environment.baseUrl;
  static String env = Environment.env;

  /// ========= NEWS ENDPOINTS ======
  /// ========================================
  ///
  static String newsListUrl = "/news";
}

class Environment {
  static String env = BaseUrlEnv.test;
  static String baseUrl = getBaseUrl(env);
}

class BaseUrlEnv {
  static const String live = 'live';
  static const String pilot = 'pilot';
  static const String test = "test";
}

String getBaseUrl(String env) {
  switch (env) {
    case BaseUrlEnv.live:
      return dotenv.env['LIVE_BASE_URL'] ?? '';
    case BaseUrlEnv.pilot:
      return dotenv.env['PILOT_BASE_URL'] ?? '';
    case BaseUrlEnv.test:
    default:
      return dotenv.env['TEST_BASE_URL'] ?? '';
  }
}
