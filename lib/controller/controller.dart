// controller/controller.dart

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api_sevices/api_client.dart';
import '../model/machine_list.dart';

class Controller extends GetxController {

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var isPasswordHidden = true.obs;

  RxList<Data> machineList = <Data>[].obs;

  Future<void> getMachines() async {

    try {

      isLoading.value = true;

      final response = await AuthApi.machines();

      machineList.value = response.data ?? [];

    } catch (e) {

      print("ERROR : $e");

    } finally {

      isLoading.value = false;
    }
  }

  @override
  void onInit() {

    getMachines();

    super.onInit();
  }
}