extension StringExtensions on String{

  bool get isNullOrEmpty => isEmpty;

  ///Capitalize
  String capitalize(){
    if(isNullOrEmpty) return this;

    return "${this[0].toUpperCase()}${substring(1)}";
  }

  /// Email Control
  bool get isValidEmail {
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    );
    return emailRegex.hasMatch(this);
  }

  /// Replaces "http://" with "https://"
  String fixHttps() {
    return startsWith('http://')
        ? replaceFirst('http://', 'https://')
        : this;
  }

  /// Shortens the string to the given length
  String shorten(int maxLength) {
    if (length <= maxLength) return this;
    return substring(0, maxLength);
  }

}

extension NullableStringExtensions on String?{

  bool get isNullOrEmpty => this == null || this!.isEmpty;
  /// Safe version of Capitalize
  String? capitalize(){
    if(isNullOrEmpty) return this;

    return "${this![0].toUpperCase()}${this!.substring(1)}";
  }
  /// Safe version of Email Control
  bool get isValidEmail {
    if (isNullOrEmpty) return false;
    final emailRegex = RegExp(
        r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
    );
    return emailRegex.hasMatch(this!);
  }

  /// Safe version of fixHttps for nullable strings
  String? fixHttps() {
    if (this == null) return null;
    return this!.startsWith('http://')
        ? this!.replaceFirst('http://', 'https://')
        : this;
  }

  /// Safe version of shorten for nullable strings
  String? shorten(int maxLength) {
    if (this == null) return null;
    if (this!.length <= maxLength) return this;
    return this!.substring(0, maxLength);
  }

}