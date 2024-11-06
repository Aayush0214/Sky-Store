import 'package:cloud_firestore/cloud_firestore.dart';


class BannerModel {
  final bool active;
  String imageUrl;
  final String targetScreen;

  BannerModel({
    required this.active,
    required this.imageUrl,
    required this.targetScreen,
  });

  /// Empty helper function
  // static BannerModel empty() =>
  //     BannerModel(active: false, imageUrl: '', targetScreen: '');

  /// Convert model to Json structure so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Active': active,
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
    };
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    // Map Json Record to the model
    return BannerModel(
      active: data['Active'] ?? false,
      imageUrl: data['ImageUrl'] ?? '' ,
      targetScreen: data['TargetScreen'] ?? '',
    );
  }
}
