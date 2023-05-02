class Courses {
  int? courseID;
  String? courseName;
  String? courseDescription;
  String? imageUrl;
  double? coursePrice;
  double? starAvg;
  String? createdDate;
  String? teacherName;
  int? teacherId;
  int? categoryId;
  int? id;
  String? queueDate;

  Courses(
      {this.courseID,
      this.courseName,
      this.courseDescription,
      this.imageUrl,
      this.coursePrice,
      this.starAvg,
      this.createdDate,
      this.teacherName,
      this.teacherId,
      this.categoryId,
      this.id,
      this.queueDate});

  Courses.fromJson(Map<String, dynamic> json) {
    courseID = json['courseID'];
    courseName = json['courseName'];
    courseDescription = json['courseDescription'];
    imageUrl = json['imageUrl'];
    coursePrice = json['coursePrice'];
    starAvg = json['starAvg'];
    createdDate = json['createdDate'];
    teacherName = json['teacherName'];
    teacherId = json['teacherId'];
    categoryId = json['categoryId'];
    id = json['id'];
    queueDate = json['queueDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['courseID'] = courseID;
    data['courseName'] = courseName;
    data['courseDescription'] = courseDescription;
    data['imageUrl'] = imageUrl;
    data['coursePrice'] = coursePrice;
    data['starAvg'] = starAvg;
    data['createdDate'] = createdDate;
    data['teacherName'] = teacherName;
    data['teacherId'] = teacherId;
    data['categoryId'] = categoryId;
    data['id'] = id;
    data['queueDate'] = queueDate;
    return data;
  }
}
