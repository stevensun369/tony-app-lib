class AppURL {
  static const String liveBaseURL = 'https://api.transitway.online';
  static const String devBaseURL = 'http://localhost:4200';
  static const String version = 'v0';

  static String baseURL = '$devBaseURL/$version';

  // static String usersCheck = '$baseURL/users/check?phone=';

  // static Uri usersSignupPhone = Uri.parse('$baseURL/users/signup/phone');
  // static Uri usersSignupCode = Uri.parse('$baseURL/users/signup/code');
  // static Uri usersSignupUsername = Uri.parse('$baseURL/users/signup/username');

  // static Uri usersLoginPhone = Uri.parse('$baseURL/users/login/phone');
  // static Uri usersLoginCode = Uri.parse('$baseURL/users/login/code');

  // static Uri usersUpdate = Uri.parse('$baseURL/users/update');
}

const Map<String, String> basicHeader = <String, String>{
  'Content-Type': 'application/json',
};

Map<String, String> authHeader(String token) {
  return <String, String>{
    'Content-Type': 'application/json',
    'Authorization': token,
  };
}
