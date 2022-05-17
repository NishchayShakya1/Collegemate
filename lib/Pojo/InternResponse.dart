import 'package:collegemate/Pojo/Internship.dart';

class InternshipResponse {
  List<Internship> internship;

  InternshipResponse({this.internship});

  InternshipResponse.fromJson(Map<String, dynamic> json) {
    if (json['internship'] != null) {
      internship = <Internship>[];
      json['internship'].forEach((v) {
        internship.add(new Internship.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.internship != null) {
      data['internship'] = this.internship.map((v) => v.toJson()).toList();
    }
    return data;
  }
}