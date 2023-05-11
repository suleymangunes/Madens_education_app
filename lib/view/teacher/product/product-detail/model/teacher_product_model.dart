class TeacherProductModel {
  int? courseID;
  String? courseName;
  String? courseDescription;
  String? imageUrl;
  num? coursePrice;
  num? starAvg;
  String? createdDate;
  String? teacherName;
  int? categoryId;
  int? id;
  List<Curriculums>? curriculums;

  TeacherProductModel(
      {this.courseID,
      this.courseName,
      this.courseDescription,
      this.imageUrl,
      this.coursePrice,
      this.starAvg,
      this.createdDate,
      this.teacherName,
      this.categoryId,
      this.id,
      this.curriculums});

  TeacherProductModel.fromJson(Map<String, dynamic> json) {
    courseID = json['courseID'];
    courseName = json['courseName'];
    courseDescription = json['courseDescription'];
    imageUrl = json['imageUrl'];
    coursePrice = json['coursePrice'];
    starAvg = json['starAvg'];
    createdDate = json['createdDate'];
    teacherName = json['teacherName'];
    categoryId = json['categoryId'];
    id = json['id'];
    if (json['curriculums'] != null) {
      curriculums = <Curriculums>[];
      json['curriculums'].forEach((v) {
        curriculums!.add(Curriculums.fromJson(v));
      });
    }
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
    data['categoryId'] = categoryId;
    data['id'] = id;
    if (curriculums != null) {
      data['curriculums'] = curriculums!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Curriculums {
  int? curriculumId;
  String? publishId;
  String? videoName;
  String? videoUrl;
  String? title;
  String? description;
  int? courseID;

  Curriculums({
    this.curriculumId,
    this.publishId,
    this.videoName,
    this.videoUrl,
    this.title,
    this.description,
    this.courseID,
  });

  Curriculums.fromJson(Map<String, dynamic> json) {
    curriculumId = json['curriculumId'];
    publishId = json['publishId'];
    videoName = json['videoName'];
    videoUrl = json['videoUrl'];
    title = json['title'];
    description = json['description'];
    courseID = json['courseID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['curriculumId'] = curriculumId;
    data['publishId'] = publishId;
    data['videoName'] = videoName;
    data['videoUrl'] = videoUrl;
    data['title'] = title;
    data['description'] = description;
    data['courseID'] = courseID;
    return data;
  }
}
