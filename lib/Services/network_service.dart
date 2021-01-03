import 'package:http/http.dart' as http;
import 'package:weather_app/Services/dialog_service.dart';
import 'package:weather_app/locator.dart';

class NetworkService {
  var dialogService = locator<DialogService>();
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
    } else {
      dialogService.showDialog(
        description: "No Internet connection, Please connect to the Internet",
        title: "No Internet",
      );
    }
  }
}
