  // static Future<Map<String, dynamic>> checkUser(String nationalId, String password) async {
  //   try {
  //     var map = {
  //       'action': CHECK_USER_ACTION,
  //       'national_id': nationalId,
  //       'password': password,
  //     };
  //     final response = await http.post(Uri.parse(API_URL), body: map);
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> data = json.decode(response.body);
  //       bool isAuthenticated = data['status'] == 'success';
  //       String userType = data['user_type'];
  //       return {
  //         'authenticated': true,
  //         'user_type': data['user_type'],
  //         'user_info': data['user_info']
  // };
  //     } else {
  //       return {'status': 'failed', 'authenticated': false, 'user_type': ''};
  //     }
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print('Error: $e');
  //     }
  //     return {'status': 'error', 'authenticated': false, 'user_type': ''};
  //   }
  // }