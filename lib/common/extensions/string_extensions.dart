extension StringExtensions on String {
  String capitalize() {
    final String temp = trim();
    return (temp.isEmpty) ? this : "${temp[0].toUpperCase()}${temp.substring(1)}";
  }
}
