import 'package:http/http.dart' as http;

class NetworkConnection {
  Future<bool> checkConnection() async {
    try {
      var result = await http.get('https://www.google.com');

      // if there is a result return true to indicate there is a connection
      if (result.statusCode == 200) {
        return true;
      }
    } catch (_) {
      // return false if there is no result to indicate
      // there is no network
      return false;
    }
    return false;
  }

  Future onConnectivityDialog(Function function) async {
    if (await checkConnection()) {
      await function();
    } else {}
  }
}
