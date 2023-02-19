import 'package:shared_preferences/shared_preferences.dart';

class UnSavedImagePrefs {
  Future<List<String>?> getUnSavedImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('unSavedImages')!;
  }

  Future<void> setUnSavedImages(imageName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> imageList = await prefs.getStringList('unSavedImages') ?? [];
    imageList.add(imageName);
    prefs.setStringList('unSavedImages', imageList);
  }

  Future<void> removeUnSavedImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('unSavedImages');
  }
}
