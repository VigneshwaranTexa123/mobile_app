class MachineAdd {
  bool? success;
  String? message;
  Data? data;

  MachineAdd({this.success, this.message, this.data});

  MachineAdd.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? machineNo;
  String? machineName;

  Data({this.machineNo, this.machineName});

  Data.fromJson(Map<String, dynamic> json) {
    machineNo = json['machine_no'];
    machineName = json['machine_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['machine_no'] = this.machineNo;
    data['machine_name'] = this.machineName;
    return data;
  }
}
