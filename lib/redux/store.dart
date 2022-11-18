import 'package:image_picker/image_picker.dart';

import '../models/user.dart';

class AppState {
  bool darkTheme = true;
  User? user;
  List<XFile> topImages = [];
  List<XFile> bottomImages = [];
  List<XFile> shoesImages = [];

  AppState({this.user});

  AppState.copyWith({
    required AppState prev,
    User? user,
    bool? darkTheme,
    List<XFile>? topImages,
    List<XFile>? bottomImages,
    List<XFile>? shoesImages,
  }) {
    this.user = user ?? prev.user;
    this.darkTheme = darkTheme ?? prev.darkTheme;
    this.topImages = topImages ?? prev.topImages;
    this.bottomImages = bottomImages ?? prev.bottomImages;
    this.shoesImages = shoesImages ?? prev.shoesImages;
  }

  AppState.initial() {
    user = null;
  }
}
