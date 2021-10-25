
enum Environment { prod, dev, custom }

extension EnvironmentExtensions on Environment {
  String get base {
    switch (this) {
      case Environment.prod:
        return 'https://rickandmortyapi.com';
      case Environment.dev:
        return 'https://rickandmortyapi.com';
      case Environment.custom:
        return '';
      default:
        return '';
    }
  }

  String get name {
    switch (this) {
      case Environment.prod:
        return 'PROD';
      case Environment.dev:
        return 'DEV';
      case Environment.custom:
        return 'CUSTOM';
      default:
        return '';
    }
  }

  String get api {
    return '${this.base}/api/';
  }
}

class EnvironmentUtils {
  static Environment from(int index) {
    switch (index) {
      case 0:
        return Environment.prod;
      case 2:
        return Environment.dev;
      case 3:
        return Environment.custom;
      default:
        return Environment.dev;
    }
  }
}
