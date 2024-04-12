class TransactionModel {
  int? selectedNumber;
  String? message;
  bool? status;

  TransactionModel({this.selectedNumber, this.message, this.status});

  TransactionModel.fromJson(Map<String, dynamic> json) {
    selectedNumber = json['selectedNumber'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['selectedNumber'] = this.selectedNumber;
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}