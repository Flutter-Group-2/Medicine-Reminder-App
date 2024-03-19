class MedicineModel {
  String? name;
  String? time;
  int? count;
  int? period;
  String? userId;

  MedicineModel({this.name, this.time, this.count, this.period, this.userId});

  MedicineModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    time = json['time'];
    count = json['count'];
    period = json['period'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['time'] = this.time;
    data['count'] = this.count;
    data['period'] = this.period;
    data['user_id'] = this.userId;
    return data;
  }
}