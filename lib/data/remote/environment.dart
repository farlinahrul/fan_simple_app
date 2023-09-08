class Environments {
  static const String production =
      'https://fan-simple-app-default-rtdb.asia-southeast1.firebasedatabase.app';
  static const String dev =
      'https://fan-simple-app-default-rtdb.asia-southeast1.firebasedatabase.app';
}

class ConfigEnvironments {
  static const String _currentEnvironments = Environments.dev;
  static const List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.dev,
    },
    {
      'env': Environments.production,
    },
  ];

  static String? getEnvironments() {
    return _availableEnvironments
        .firstWhere(
          (d) => d['env'] == _currentEnvironments,
        )
        .values
        .last
        .toString();
  }
}
