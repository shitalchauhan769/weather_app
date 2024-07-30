import 'package:shared_preferences/shared_preferences.dart';

class SharedHelper {
  Future<void> setTheme(String ThemeName) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    await shr.setString("theme", ThemeName);
  }

  Future<String?> getTheme() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    String? theme = shr.getString("theme");
    return theme;
  }

  void setBookMarkData(List<String> cityList)async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setStringList("bookMark", cityList);
  }
  Future<List<String>?> getBookMarkData()
  async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    List<String>? cityList=shr.getStringList("cityList") ;
    return cityList;
  }

  Future<void> setCityData(List<String> cityList) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setStringList("bookmark", cityList);
  }

  Future<List<String>?> getCityData() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    return shr.getStringList("bookmark");
  }
}
