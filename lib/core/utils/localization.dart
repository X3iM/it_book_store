import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'en_EN': {
      'app_title': 'IT Book',
      'loading': 'Loading',
      'search': 'Search',
      'price': 'Price',
      'publisher': 'Publisher',
      'pages': 'Pages',
      'rating': 'Rating',
      'year': 'Year',
      'prev': 'PREV',
      'next': 'NEXT',
      'server_failure': 'Server failure',
      'parameters_failure': 'Parameters failure',
      'unknown_failure': 'Unknown failure',
      'no_internet_connection': 'No internet connection',
      'error': 'Error',
    }
  };

}