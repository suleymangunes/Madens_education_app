class AddCourseModel {
  String? courseName;
  String? courseDescription;
  String? imageUrl;
  num? coursePrice;
  int? categoryId;

  AddCourseModel({this.courseName, this.courseDescription, this.imageUrl, this.coursePrice, this.categoryId});

  AddCourseModel.fromJson(Map<String, dynamic> json) {
    courseName = json['courseName'];
    courseDescription = json['courseDescription'];
    imageUrl = json['imageUrl'];
    coursePrice = json['coursePrice'];
    categoryId = json['categoryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['courseName'] = courseName;
    data['courseDescription'] = courseDescription;
    data['imageUrl'] = imageUrl;
    data['coursePrice'] = coursePrice;
    data['categoryId'] = categoryId;
    return data;
  }
}
