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
  //will change env when other environments urls are available
  //for now all will be same
  switch (env) {
    case BaseUrlEnv.live:
      return "https://finnhub.io/api/v1";
    case BaseUrlEnv.pilot:
      return "https://finnhub.io/api/v1";
    case BaseUrlEnv.test:
    default:
      return "https://finnhub.io/api/v1";
  }
}
