import 'package:fluttermvvmtemplate/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'test_model.g.dart';

@JsonSerializable()
class TestModel extends BaseModel<TestModel> {
  int? userId;
  int? id;
  String? title;
  bool? completed;

  TestModel({this.userId, this.id, this.title, this.completed});

  Map<String, dynamic> toJson() {
    return _$TestModelToJson(this);
  }
  
  @override
  TestModel fromJson(Map<String, dynamic> json) {
    return _$TestModelFromJson(json);
  }
}