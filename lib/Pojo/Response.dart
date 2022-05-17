import 'package:collegemate/Pojo/Contest.dart';

class Response {
  List<Contest> contest;

  Response({this.contest});

  Response.fromJson(Map<String, dynamic> json) {
    if (json['contest'] != null) {
      contest = <Contest>[];
      json['contest'].forEach((v) {
        contest.add(new Contest.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.contest != null) {
      data['contest'] = this.contest.map((v) => v.toJson()).toList();
    }
    return data;
  }
}