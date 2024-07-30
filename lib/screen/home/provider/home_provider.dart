import 'package:flutter/material.dart';
import 'package:sky_app/screen/home/model/home_model.dart';

import '../../../utils/shared_halper.dart';
import '../../../utils/weather_api.dart';


class HomeProvider with ChangeNotifier {
  Future<HomeModel?>? model;
  String city= "surat";
  String themeName = "system";
  String? theme;
  DateTime time = DateTime.now();
  List<String>? bookMark=[];

  void getWeatherAPI(String city) {
    SkyAPI helper = SkyAPI();
    model = helper.SkyHelperAPI(city);

    model!.then((value) {
        if (value!= null) {
          notifyListeners();
        }
      },
    );
  }
  void setTheme(String theme) {
    SharedHelper shr = SharedHelper();
    shr.setTheme(theme );
    getTheme();
  }
  Future<void> getTheme() async {
    SharedHelper shr = SharedHelper();
    theme=await shr.getTheme();
    notifyListeners();
  }
  void setBookMarks(String url)
  {
    getBookMarks();
    bookMark!.add(url);
    SharedHelper share = SharedHelper();
    share.setBookMarkData(bookMark!);
    getBookMarks();
    notifyListeners();
  }

  Future<void> getBookMarks()
  async {
    SharedHelper share = SharedHelper();
    var l1 = await share.getBookMarkData();
    if(l1!=null)
    {
      bookMark =l1;
    }
    notifyListeners();
  }

  void delete(int w)
  {
    getBookMarks();
    bookMark!.removeAt(w);
    // setCityData(bookMark);
    getBookMarks();
    notifyListeners();

  }
}



//void getTodos() async {
//     APIHelper helper = APIHelper();
//     var l1 = await helper.APITodos();
//     if (l1 != null) {
//       todosList = l1;
//       notifyListeners();
//     }
//   }

// void getWallpaperAPI() {
//     WallpaperHelper helper = WallpaperHelper();
//
//     wallpaperModel = helper.WallpaperAPI(search,page);
//
//     wallpaperModel!.then(
//       (value) {
//         if (value != null) {
//           notifyListeners();
//         }
//       },
//     );
//   }
