class ServiceModel {
  final int id;
  final String documentId;
  final String name;
  final String description;
  final double price;
  final String createdAt;
  final String updatedAt;
  final String publishedAt;
  final Media icon;
  final Media banner;

  ServiceModel({
    required this.id,
    required this.documentId,
    required this.name,
    required this.description,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.icon,
    required this.banner,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      documentId: json['documentId'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      publishedAt: json['publishedAt'],
      icon: Media.fromJson(json['icon']),
      banner: Media.fromJson(json['banner']),
    );
  }
}

class Media {
  final int id;
  final String documentId;
  final String name;
  final int width;
  final int height;
  final Map<String, Format> formats;
  final String hash;
  final String ext;
  final String mime;
  final double size;
  final String url;
  final String? previewUrl;

  Media({
    required this.id,
    required this.documentId,
    required this.name,
    required this.width,
    required this.height,
    required this.formats,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    this.previewUrl,
  });

  factory Media.fromJson(Map<String, dynamic> json) {
    return Media(
      id: json['id'],
      documentId: json['documentId'],
      name: json['name'],
      width: json['width'],
      height: json['height'],
      formats: (json['formats'] as Map<String, dynamic>)
          .map((k, v) => MapEntry(k, Format.fromJson(v))),
      hash: json['hash'],
      ext: json['ext'],
      mime: json['mime'],
      size: (json['size'] as num).toDouble(),
      url: json['url'],
      previewUrl: json['previewUrl'],
    );
  }
}

class Format {
  final String ext;
  final String url;
  final String hash;
  final String mime;
  final String name;
  final int width;
  final int height;
  final double size;
  final int sizeInBytes;

  Format({
    required this.ext,
    required this.url,
    required this.hash,
    required this.mime,
    required this.name,
    required this.width,
    required this.height,
    required this.size,
    required this.sizeInBytes,
  });

  factory Format.fromJson(Map<String, dynamic> json) {
    return Format(
      ext: json['ext'],
      url: json['url'],
      hash: json['hash'],
      mime: json['mime'],
      name: json['name'],
      width: json['width'],
      height: json['height'],
      size: (json['size'] as num).toDouble(),
      sizeInBytes: json['sizeInBytes'],
    );
  }
}

class Meta {
  final Pagination pagination;

  Meta({required this.pagination});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(pagination: Pagination.fromJson(json['pagination']));
  }
}

class Pagination {
  final int page;
  final int pageSize;
  final int pageCount;
  final int total;

  Pagination({
    required this.page,
    required this.pageSize,
    required this.pageCount,
    required this.total,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      page: json['page'],
      pageSize: json['pageSize'],
      pageCount: json['pageCount'],
      total: json['total'],
    );
  }
}
