class OfficerModel {
  final String name;
  final String mobile;
  final String post;
  final String imageUrl;
  final String publicId;

  OfficerModel({
    required this.name,
    required this.mobile,
    required this.post,
    required this.imageUrl,
    required this.publicId,
  });

  // Model → Map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'mobile': mobile,
      'post': post,
      'imageUrl': imageUrl,
      'publicId': publicId,
    };
  }

  factory OfficerModel.fromMap(Map<String, dynamic> map) {
    return OfficerModel(
      name: map['name'] ?? '',
      mobile: map['mobile'] ?? '',
      post: map['post'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      publicId: map['publicId'] ?? '',
    );
  }
}