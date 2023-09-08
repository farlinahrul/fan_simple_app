import 'package:json_annotation/json_annotation.dart';

import '../../../model/meta_data.dart';
import 'base_response.dart';
import 'model_factory.dart';

class ApiResponse<T> extends BaseResponse {
  final T? result;

  ApiResponse({
    required int status,
    required String message,
    required String domain,
    this.result,
  }) : super(status: status, message: message, domain: domain);

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return ApiResponse<T>(
        status: json["status"] as int,
        message: json["message"] as String,
        domain: json["domain"] as String,
        result: _Converter<T?>().fromJson(json["results"] ?? json["data"]));
  }
}

class ApiResponses<T> extends BaseResponse {
  List<T>? data;
  Meta? metaData;

  ApiResponses({
    required int status,
    required String message,
    required String domain,
    this.data = const [],
    required this.metaData,
  }) : super(status: status, message: message, domain: domain);

  factory ApiResponses.fromJson(Map<String, dynamic> json) => ApiResponses<T>(
        status: json["status"],
        message: json["message"],
        domain: json["domain"],
        data: List<T>.from(
            json["results"].map((x) => _Converter<T?>().fromJson(x))),
        metaData: Meta.fromJson(json["meta"]),
      );
}

class PaginatedList<T> extends BaseResponse {
  List<T>? data;

  PaginatedList({
    required int status,
    required String message,
    required String domain,
    this.data = const [],
    required this.links,
    required this.meta,
  }) : super(status: status, message: message, domain: domain);
  Links links;
  Meta meta;

  factory PaginatedList.fromJson(Map<String, dynamic> json) => PaginatedList<T>(
        data: json["results"] == null
            ? []
            : List<T>.from(json["results"]
                .map((x) => _Converter<T>().fromJson(x as Object))),
        links: Links.fromJson(json["links"] ?? {}),
        meta: Meta.fromJson(json["meta"] ?? {}),
        status: json["status"],
        message: json["message"],
        domain: json["domain"],
      );
}

class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  String? first;
  String? last;
  String? prev;
  String? next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
      );
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  int? currentPage;
  int? from;
  int? lastPage;
  List<Link>? links;
  String? path;
  int? perPage;
  int? to;
  int? total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: json["links"] != null
            ? List<Link>.from(
                json["links"].map((x) => Link.fromJson(x ?? {})))
            : [],
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
      );
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
      );
}

// class PaginatedList<T> {
//   PaginatedList({
//     this.currentPage = 0,
//     this.from = 0,
//     this.items = const [],
//     this.pageSize = 0,
//     this.to = 0,
//     this.totalCount = 0,
//     this.totalPages = 0,
//     this.hasPreviousPage = false,
//     this.hasNextPage = false,
//   });

//   final int currentPage;
//   final int from;
//   final List<T> items;
//   final int pageSize;
//   final int to;
//   final int totalCount;
//   final int totalPages;
//   final bool hasPreviousPage;
//   final bool hasNextPage;

//   factory PaginatedList.fromJson(Map<String, dynamic> json) => PaginatedList<T>(
//         currentPage: json['currentPage'] == null ? 0 : json['currentPage'],
//         from: json['from'] == null ? 0 : json['from'],
//         items: json["items"] == null
//             ? []
//             : List<T>.from(json["items"]
//                 .map((x) => _Converter<T>().fromJson(x as Object))),
//         pageSize: json['pageSize'] == null ? 0 : json['pageSize'],
//         to: json['to'] == null ? 0 : json['to'],
//         totalCount: json['totalCount'] == null ? 0 : json['totalCount'],
//         totalPages: json['totalPages'] == null ? 0 : json['totalPages'],
//         hasPreviousPage:
//             json['hasPreviousPage'] == null ? false : json['hasPreviousPage'],
//         hasNextPage: json['hasNextPage'] == null
//             ? json['currentPage'] != null &&
//                 json['totalPages'] != null &&
//                 json['currentPage'] < json['totalPages']
//             : json['hasNextPage'],
//       );
// }

class _Converter<T> implements JsonConverter<T?, Object?> {
  const _Converter();

  @override
  T? fromJson(Object? json) {
    if (json is Map<String, dynamic>) {
      return ModelFactory.fromJson(T, json) as T;
    }
    return json as T;
  }

  @override
  Object toJson(T? object) {
    return (object as Object);
  }
}
