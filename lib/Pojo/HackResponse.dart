import 'package:collegemate/Pojo/Hackathon.dart';

class HackathonResponse {
  List<Hackathon> hackathon;

  HackathonResponse({this.hackathon});

  HackathonResponse.fromJson(Map<String, dynamic> json) {
    if (json['hackathon'] != null) {
      hackathon = <Hackathon>[];
      json['hackathon'].forEach((v) {
        hackathon.add(new Hackathon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hackathon != null) {
      data['hackathon'] = this.hackathon.map((v) => v.toJson()).toList();
    }
    return data;
  }
}