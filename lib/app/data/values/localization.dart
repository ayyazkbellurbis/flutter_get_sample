import 'package:get/get.dart';
import 'package:sample/app/data/values/languages/string_en.dart';
import 'package:sample/app/data/values/languages/string_hi.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': StringEN.value,
        'hi_IN': StringHI.value,
      };
}
