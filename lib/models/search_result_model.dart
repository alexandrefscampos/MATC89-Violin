class SearchResultModel {
  int? resultCount;
  List<Result>? results;

  SearchResultModel({this.resultCount, this.results});

  SearchResultModel.fromJson(Map<String, dynamic> json) {
    resultCount = json['resultCount'];
    if (json['results'] != null) {
      results = <Result>[];
      json['results'].forEach((v) {
        results!.add(Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['resultCount'] = resultCount;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String? wrapperType;
  String? kind;
  int? artistId;
  int? collectionId;
  int? trackId;
  String? artistName;
  String? collectionName;
  String? trackName;
  String? collectionCensoredName;
  String? trackCensoredName;
  String? artistViewUrl;
  String? collectionViewUrl;
  String? trackViewUrl;
  String? previewUrl;
  String? artworkUrl30;
  String? artworkUrl60;
  String? artworkUrl100;
  double? collectionPrice;
  double? trackPrice;
  String? releaseDate;
  String? collectionExplicitness;
  String? trackExplicitness;
  int? discCount;
  int? discNumber;
  int? trackCount;
  int? trackNumber;
  int? trackTimeMillis;
  String? country;
  String? currency;
  String? primaryGenreName;
  bool? isStreamable;
  String? contentAdvisoryRating;
  String? copyright;
  String? description;
  bool? isFavorite;
  int? rating;
  List<String> reviews;

  Result({
    this.wrapperType,
    this.kind,
    this.artistId,
    this.collectionId,
    this.trackId,
    this.artistName,
    this.collectionName,
    this.trackName,
    this.collectionCensoredName,
    this.trackCensoredName,
    this.artistViewUrl,
    this.collectionViewUrl,
    this.trackViewUrl,
    this.previewUrl,
    this.artworkUrl30,
    this.artworkUrl60,
    this.artworkUrl100,
    this.collectionPrice,
    this.trackPrice,
    this.releaseDate,
    this.collectionExplicitness,
    this.trackExplicitness,
    this.discCount,
    this.discNumber,
    this.trackCount,
    this.trackNumber,
    this.trackTimeMillis,
    this.country,
    this.currency,
    this.primaryGenreName,
    this.isStreamable,
    this.contentAdvisoryRating,
    this.copyright,
    this.description,
    this.isFavorite,
    this.rating,
    this.reviews = const [],
  });

  Result.fromJson(Map<String, dynamic> json)
      : wrapperType = json['wrapperType'],
        kind = json['kind'],
        artistId = json['artistId'],
        collectionId = json['collectionId'],
        trackId = json['trackId'],
        artistName = json['artistName'],
        collectionName = json['collectionName'],
        trackName = json['trackName'],
        collectionCensoredName = json['collectionCensoredName'],
        trackCensoredName = json['trackCensoredName'],
        artistViewUrl = json['artistViewUrl'],
        collectionViewUrl = json['collectionViewUrl'],
        trackViewUrl = json['trackViewUrl'],
        previewUrl = json['previewUrl'],
        artworkUrl30 = json['artworkUrl30'],
        artworkUrl60 = json['artworkUrl60'],
        artworkUrl100 = json['artworkUrl100'],
        collectionPrice = json['collectionPrice'],
        trackPrice = json['trackPrice'],
        releaseDate = json['releaseDate'],
        collectionExplicitness = json['collectionExplicitness'],
        trackExplicitness = json['trackExplicitness'],
        discCount = json['discCount'],
        discNumber = json['discNumber'],
        trackCount = json['trackCount'],
        trackNumber = json['trackNumber'],
        trackTimeMillis = json['trackTimeMillis'],
        country = json['country'],
        currency = json['currency'],
        primaryGenreName = json['primaryGenreName'],
        isStreamable = json['isStreamable'],
        contentAdvisoryRating = json['contentAdvisoryRating'],
        copyright = json['copyright'],
        description = json['description'],
        isFavorite = json['isFavorite'],
        rating = json['rating'],
        reviews = (json['reviews'] as List<dynamic>?)
                ?.map((e) => e.toString())
                .toList() ??
            [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wrapperType'] = wrapperType;
    data['kind'] = kind;
    data['artistId'] = artistId;
    data['collectionId'] = collectionId;
    data['trackId'] = trackId;
    data['artistName'] = artistName;
    data['collectionName'] = collectionName;
    data['trackName'] = trackName;
    data['collectionCensoredName'] = collectionCensoredName;
    data['trackCensoredName'] = trackCensoredName;
    data['artistViewUrl'] = artistViewUrl;
    data['collectionViewUrl'] = collectionViewUrl;
    data['trackViewUrl'] = trackViewUrl;
    data['previewUrl'] = previewUrl;
    data['artworkUrl30'] = artworkUrl30;
    data['artworkUrl60'] = artworkUrl60;
    data['artworkUrl100'] = artworkUrl100;
    data['collectionPrice'] = collectionPrice;
    data['trackPrice'] = trackPrice;
    data['releaseDate'] = releaseDate;
    data['collectionExplicitness'] = collectionExplicitness;
    data['trackExplicitness'] = trackExplicitness;
    data['discCount'] = discCount;
    data['discNumber'] = discNumber;
    data['trackCount'] = trackCount;
    data['trackNumber'] = trackNumber;
    data['trackTimeMillis'] = trackTimeMillis;
    data['country'] = country;
    data['currency'] = currency;
    data['primaryGenreName'] = primaryGenreName;
    data['isStreamable'] = isStreamable;
    data['contentAdvisoryRating'] = contentAdvisoryRating;
    data['copyright'] = copyright;
    data['description'] = description;
    data['isFavorite'] = isFavorite;
    data['rating'] = rating;
    data['rating'] = rating;
    data['reviews'] = reviews.map((e) => e).toList();
    return data;
  }

  Result copyWith({
    String? wrapperType,
    String? kind,
    int? artistId,
    int? collectionId,
    int? trackId,
    String? artistName,
    String? collectionName,
    String? trackName,
    String? collectionCensoredName,
    String? trackCensoredName,
    String? artistViewUrl,
    String? collectionViewUrl,
    String? trackViewUrl,
    String? previewUrl,
    String? artworkUrl30,
    String? artworkUrl60,
    String? artworkUrl100,
    double? collectionPrice,
    double? trackPrice,
    String? releaseDate,
    String? collectionExplicitness,
    String? trackExplicitness,
    int? discCount,
    int? discNumber,
    int? trackCount,
    int? trackNumber,
    int? trackTimeMillis,
    String? country,
    String? currency,
    String? primaryGenreName,
    bool? isStreamable,
    String? contentAdvisoryRating,
    String? copyright,
    String? description,
    bool? isFavorite,
    int? rating,
    List<String>? reviews,
  }) {
    return Result(
      wrapperType: wrapperType ?? this.wrapperType,
      kind: kind ?? this.kind,
      artistId: artistId ?? this.artistId,
      collectionId: collectionId ?? this.collectionId,
      trackId: trackId ?? this.trackId,
      artistName: artistName ?? this.artistName,
      collectionName: collectionName ?? this.collectionName,
      trackName: trackName ?? this.trackName,
      collectionCensoredName:
          collectionCensoredName ?? this.collectionCensoredName,
      trackCensoredName: trackCensoredName ?? this.trackCensoredName,
      artistViewUrl: artistViewUrl ?? this.artistViewUrl,
      collectionViewUrl: collectionViewUrl ?? this.collectionViewUrl,
      trackViewUrl: trackViewUrl ?? this.trackViewUrl,
      previewUrl: previewUrl ?? this.previewUrl,
      artworkUrl30: artworkUrl30 ?? this.artworkUrl30,
      artworkUrl60: artworkUrl60 ?? this.artworkUrl60,
      artworkUrl100: artworkUrl100 ?? this.artworkUrl100,
      collectionPrice: collectionPrice ?? this.collectionPrice,
      trackPrice: trackPrice ?? this.trackPrice,
      releaseDate: releaseDate ?? this.releaseDate,
      collectionExplicitness:
          collectionExplicitness ?? this.collectionExplicitness,
      trackExplicitness: trackExplicitness ?? this.trackExplicitness,
      discCount: discCount ?? this.discCount,
      discNumber: discNumber ?? this.discNumber,
      trackCount: trackCount ?? this.trackCount,
      trackNumber: trackNumber ?? this.trackNumber,
      trackTimeMillis: trackTimeMillis ?? this.trackTimeMillis,
      country: country ?? this.country,
      currency: currency ?? this.currency,
      primaryGenreName: primaryGenreName ?? this.primaryGenreName,
      isStreamable: isStreamable ?? this.isStreamable,
      contentAdvisoryRating:
          contentAdvisoryRating ?? this.contentAdvisoryRating,
      copyright: copyright ?? this.copyright,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      rating: rating ?? this.rating,
      reviews: reviews ?? this.reviews,
    );
  }
}
