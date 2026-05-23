class UserSession {
  static String email = 'salman@email.com';
  static String username = 'Salman';

  static void login({required String emailAddress}) {
    email = emailAddress.trim();
    username = getUsernameFromEmail(email);
  }

  static void logout() {
    email = 'salman@email.com';
    username = 'Salman';
  }

  static String getUsernameFromEmail(String emailStr) {
    if (!emailStr.contains('@')) {
      if (emailStr.isEmpty) return 'User';
      return emailStr[0].toUpperCase() + emailStr.substring(1);
    }
    String namePart = emailStr.split('@')[0];
    List<String> words = namePart.split(RegExp(r'[._-]'));
    return words
        .where((word) => word.isNotEmpty)
        .map((word) => word[0].toUpperCase() + word.substring(1))
        .join(' ');
  }

  static String get initial {
    if (username.isEmpty) return 'U';
    return username[0].toUpperCase();
  }
}
