import 'package:http/http.dart' as http;
import 'package:http/http.dart';

// class ApiService {
//   Future<Map?> getData(String cityName) async {
//     Uri uri = Uri.parse(
//         'https://api.weatherapi.com/v1/forecast.json?key=e4f0539c899c48438e7162756243107&q=$cityName');
//
//     Response response = await http.get(uri);
//
//     if (response.statusCode == 200) {
//       final json = response.body;
//       final Map data = jsonDecode(json);
//       return data;
//     } else {
//       return null;
//     }
//   }
// }
//
// Future<Map?> getData(String cityName) async {
//   Uri uri = Uri.parse(
//       'https://api.weatherapi.com/v1/forecast.json?key=e4f0539c899c48438e7162756243107&q=$cityName');
//   Response response = await http.get(uri);
//
//   if (response.statusCode == 200) {
//     final json = response.body;
//     final Map data = jsonDecode(json);
//     return data;
//   } else {
//     return null;
//   }
// }
class ApiServices {

  static final ApiServices apiservice = ApiServices._singleton();

  ApiServices._singleton();

  Future<String?> getData(String? query)
  async {
    String finalQuery = query?.isNotEmpty == true ? query! : 'Surat';
    String apiData =
        'https://api.weatherapi.com/v1/forecast.json?key=e4f0539c899c48438e7162756243107&q=$finalQuery';
    Uri uri = Uri.parse(apiData);
    Response response = await http.get(uri);

    if (response.statusCode == 200) {
      print('Api Called');
      return response.body;
    }
    return null;
  }
}