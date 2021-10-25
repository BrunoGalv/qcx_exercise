import 'dart:convert';
import 'package:qcx_exercise/src/modules/home/domain/entities/info_list.dart';

class InfoListModel extends InfoList {
  final int count;
  final int pages;
  final String? prev;
  final String? next;

  InfoListModel(
      {
        required this.count,
        required this.pages,
        this.prev,
        this.next,
      }) : super(0, 0, null, null);

  Map<String, dynamic> toMap() {
    return {
      'count': this.count,
      'pages': this.pages,
      'prev': this.prev,
      'next': this.next,
    };
  }

  static InfoListModel fromMap(Map<String, dynamic> map) {
    return InfoListModel(
      count: map['count'] as int,
      pages: map['pages'] as int,
      prev: map['prev'] as String?,
      next: map['next'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  static InfoListModel fromJson(String source) => fromMap(jsonDecode(source));
}