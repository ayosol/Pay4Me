class Helper {
  static String generateUid() {
    return DateTime.now().millisecondsSinceEpoch.toString();
  }
}