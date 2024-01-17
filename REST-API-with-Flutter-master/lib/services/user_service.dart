import 'package:http/http.dart' as http;
class UserService{
  Future<http.Response> getData()async{
    http.Response  response = await http.get(Uri.parse('/users'));
    return response;
  }
}