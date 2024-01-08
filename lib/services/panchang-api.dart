// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:connectivity/connectivity.dart';

// class ApiService {
//   static Future<Map<String, dynamic>> fetchData() async {
//     var connectivityResult = await Connectivity().checkConnectivity();
//     if (connectivityResult == ConnectivityResult.none) {
//       print('No Internet Connection');
//       return {};
//     } else {
//       print('Connection available');
//     }

//     DateTime now = DateTime.now();

//     final Map<String, dynamic> requestBody = {
//       "day": now.day,
//       "month": now.month,
//       "year": now.year,
//       "hour": now.hour,
//       "min": now.minute,
//       "lat": 28.535517,
//       "lon": 77.391029,
//       "tzone": 5.5
//     };

//     try {
//       final http.Response response = await http.post(
//         Uri.parse('https://json.astrologyapi.com/v1/advanced_panchang/sunrise'),
//         headers: <String, String>{
//           'Content-Type': 'application/json',
//           'authorization':
//               'Basic NjIwMDE1OmQ0ZTQzNTkwNmY4YmRhZjlhYTZiY2ZlOWY3ZjY0NzRk',
//         },
//         body: jsonEncode(requestBody),
//       );

//       print('Response Status Code: ${response.statusCode}');
//       print('Response Body: ${response.body}');

//       if (response.statusCode == 200) {
//         return Map<String, dynamic>.from(jsonDecode(response.body));
//       } else {
//         print('Check again');
//         return {};
//       }
//     } catch (e) {
//       print('Error: $e');
//       return {};
//     }
//   }
// }
