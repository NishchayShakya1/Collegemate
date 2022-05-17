import 'package:collegemate/Pojo/Scholarship.dart';

class ScholarshipResponse {
  List<Scholarship> scholarship;

  ScholarshipResponse({this.scholarship});

  ScholarshipResponse.fromJson(Map<String, dynamic> json) {
    if (json['scholarship'] != null) {
      scholarship = <Scholarship>[];
      json['scholarship'].forEach((v) {
        scholarship.add(new Scholarship.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.scholarship != null) {
      data['scholarship'] = this.scholarship.map((v) => v.toJson()).toList();
    }
    return data;
  }
}