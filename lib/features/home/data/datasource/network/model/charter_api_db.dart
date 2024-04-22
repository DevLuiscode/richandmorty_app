import 'package:rick_morty_app/features/home/data/datasource/network/model/charter_result.dart';

class CharterApiDb {
  final Info info;
  final List<CharterResult> results;

  CharterApiDb({
    required this.info,
    required this.results,
  });

  CharterApiDb copyWith({
    Info? info,
    List<CharterResult>? results,
  }) =>
      CharterApiDb(
        info: info ?? this.info,
        results: results ?? this.results,
      );

  factory CharterApiDb.fromJson(Map<String, dynamic> json) => CharterApiDb(
        info: Info.fromJson(json["info"]),
        results: List<CharterResult>.from(
            json["results"].map((x) => CharterResult.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Info {
  final int count;
  final int pages;
  final String next;
  final dynamic prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });

  Info copyWith({
    int? count,
    int? pages,
    String? next,
    dynamic prev,
  }) =>
      Info(
        count: count ?? this.count,
        pages: pages ?? this.pages,
        next: next ?? this.next,
        prev: prev ?? this.prev,
      );

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}
