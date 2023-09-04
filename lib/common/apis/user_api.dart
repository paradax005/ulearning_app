import 'package:ulearning_app/common/entities/user.dart';
import 'package:ulearning_app/common/utils/http_utils.dart';

class UserAPI {
  static login({LoginRequestEntity? data}) async {
    var response = await HttpUtil().post(
      'api/auth/login',
      data: data?.toJson(),
    );
    return UserLoginResponseEntity.fromJson(response);
  }
}
