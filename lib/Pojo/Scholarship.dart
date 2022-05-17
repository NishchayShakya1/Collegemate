class Scholarship {
  String sId;
  int id;
  String name;
  String startDate;
  String endDate;
  String website;
  String link;
  int iV;

  Scholarship(
      {this.sId,
      this.id,
      this.name,
      this.startDate,
      this.endDate,
      this.website,
      this.link,
      this.iV});

  Scholarship.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    name = json['name'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    website = json['website'];
    link = json['link'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['name'] = this.name;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['website'] = this.website;
    data['link'] = this.link;
    data['__v'] = this.iV;
    return data;
  }
}