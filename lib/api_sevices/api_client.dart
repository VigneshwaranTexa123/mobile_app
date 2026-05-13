

import 'package:dio/dio.dart';
import 'package:mobile_app/api_sevices/api_routes.dart';

import '../model/machine_add.dart';
import '../model/machine_list.dart';

class ApiClient {
  static Dio dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ),
  );
}

class AuthApi {

  static Future<MechineModel> machines() async {
    final response = await ApiClient.dio.get(
      ApiRoutes.machine,
    );

    print("Response: ${response.data}");
    return MechineModel.fromJson(response.data);
  }

  static Future<MachineAdd> signup() async {
    final response = await ApiClient.dio.post(
      ApiRoutes.machine,
      data: {
        "machine_no": 5,
        "machine_name": "New Machine",
        "image": "assets/bg_remove.png",
        "machine_status": "RUNNING",
        "datas": {
          "good": 10,
          "empty": 0,
          "defect": 1,
          "inspect": 9,
          "full_cops": 8,
          "half_cops": 1,
          "quarter_cops": 0,
          "doff_number": 25
        }
      },
    );
    return MachineAdd.fromJson(response.data);
  }
}