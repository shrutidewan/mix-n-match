import 'package:image_picker/image_picker.dart';

import '../models/user.dart';

abstract class Action {}

class ToggleTheme extends Action {
  bool darkTheme;

  ToggleTheme({this.darkTheme = true});
}

class UpdateNewUser extends Action {
  User newUser;

  UpdateNewUser({required this.newUser});
}

class UpdateTopImages extends Action {
  List<XFile> topImages;
  UpdateTopImages({required this.topImages});
}

class UpdateBottomImages extends Action {
  List<XFile> bottomImages;
  UpdateBottomImages({required this.bottomImages});
}

class UpdateShoesImages extends Action {
  List<XFile> shoesImages;
  UpdateShoesImages({required this.shoesImages});
}
