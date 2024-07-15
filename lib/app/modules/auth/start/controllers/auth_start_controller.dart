
import 'package:sample/app/data/repository/user_repository.dart';
import 'package:sample/base/base_controller.dart';
import 'package:sample/utils/helper/text_field_wrapper.dart';

class AuthStartController extends BaseController<UserRepository> {
  final inputText = TextFieldWrapper();

  @override
  void onReady() async {
    inputText.controller.text = '';
  }
}
