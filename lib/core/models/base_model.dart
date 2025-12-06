import 'package:equatable/equatable.dart';

abstract class BaseModel<T> extends Equatable {
  Map<String, dynamic> toJson();
  T fromJson(Map<String, dynamic> json);
}
