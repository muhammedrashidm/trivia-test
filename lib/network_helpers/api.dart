import 'package:http/http.dart'as http;

class Api{

Future<http.Response> getRequest(String uri)async{
  final url = Uri.parse(uri);
  return await http.get(url);
}

}