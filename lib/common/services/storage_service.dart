import 'package:shared_preferences/shared_preferences.dart';
import 'package:ulearning_app/common/constants/constant.dart';

class StorageService {
  late SharedPreferences _pref;

  Future<StorageService> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> writeBoolInStorage(String key, bool value) async {
    return await _pref.setBool(key, value);
  }

  Future<bool> writeStringInStorage(String key, String value) async {
    return await _pref.setString(key, value);
  }

  bool getDeviceFirstOpen() {
    return _pref.getBool(AppConstants.STORAGE_DEVICE_OPEN_FIRST_TIME) ?? false;
  }

  bool getUserIsLoggedIn() {
    return _pref.getString(AppConstants.STORAGE_USER_TOKEN_KEY) == null ? false : true;
  }
}
