class MechineModel {
  bool? success;
  List<Data>? data;

  MechineModel({this.success, this.data});

  MechineModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? machineNo;
  String? machineName;
  String? image;
  String? machineStatus;
  Datas? datas;

  Data(
      {this.machineNo,
        this.machineName,
        this.image,
        this.machineStatus,
        this.datas});

  Data.fromJson(Map<String, dynamic> json) {
    machineNo = json['machine_no'];
    machineName = json['machine_name'];
    image = json['image'];
    machineStatus = json['machine_status'];
    datas = json['datas'] != null ? new Datas.fromJson(json['datas']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['machine_no'] = this.machineNo;
    data['machine_name'] = this.machineName;
    data['image'] = this.image;
    data['machine_status'] = this.machineStatus;
    if (this.datas != null) {
      data['datas'] = this.datas!.toJson();
    }
    return data;
  }
}

class Datas {
  int? good;
  int? empty;
  int? defect;
  int? inspect;
  int? fullCops;
  int? halfCops;
  int? quarterCops;
  int? doffNumber;

  Datas(
      {this.good,
        this.empty,
        this.defect,
        this.inspect,
        this.fullCops,
        this.halfCops,
        this.quarterCops,
        this.doffNumber});

  Datas.fromJson(Map<String, dynamic> json) {
    good = json['good'];
    empty = json['empty'];
    defect = json['defect'];
    inspect = json['inspect'];
    fullCops = json['full_cops'];
    halfCops = json['half_cops'];
    quarterCops = json['quarter_cops'];
    doffNumber = json['doff_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['good'] = this.good;
    data['empty'] = this.empty;
    data['defect'] = this.defect;
    data['inspect'] = this.inspect;
    data['full_cops'] = this.fullCops;
    data['half_cops'] = this.halfCops;
    data['quarter_cops'] = this.quarterCops;
    data['doff_number'] = this.doffNumber;
    return data;
  }
}
