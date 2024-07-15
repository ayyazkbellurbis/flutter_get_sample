extension NullStringExtensions on String? {
  String orEmpty() => this == null ? "" : this!;
}

extension StringExtensions on String {
  int toInt() {
    try {
      return int.parse(this);
    } catch (e) {
      return 0;
    }
  }
}
