import 'dart:convert';

class LiveDoffModel {
  int? id;
  int machineNo;
  Map<String, dynamic> datas;
  String machineStatus;
  int status;

  LiveDoffModel({
    this.id,
    required this.machineNo,
    required this.datas,
    required this.machineStatus,
    required this.status,
  });

  factory LiveDoffModel.fromMap(Map<String, dynamic> map) {
    return LiveDoffModel(
      id: map['id'],
      machineNo: map['machine_no'],
      datas: jsonDecode(map['datas']),
      machineStatus: map['machine_status'],
      status: map['status'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'machine_no': machineNo,
      'datas': jsonEncode(datas),
      'machine_status': machineStatus,
      'status': status,
    };
  }
}