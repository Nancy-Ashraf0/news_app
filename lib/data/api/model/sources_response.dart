import 'package:news_app0/data/api/model/base_response.dart';

import 'source.dart';

class SourcesResponse extends BaseResponse {
  List<Source>? sources;
  SourcesResponse({
    this.sources,
  });

  SourcesResponse.fromJson(dynamic json) : super.fromJson(json){
    if (json['sources'] != null) {
      sources = [];
      json['sources'].forEach((v) {
        sources?.add(Source.fromJson(v));
      });
    }
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (sources != null) {
      map['sources'] = sources?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
