import '../../domain/entities/spyfall_location_entity.dart';

class SpyfallLocationModel extends SpyfallLocationEntity {
  const SpyfallLocationModel({
    required super.id,
    required super.titleKey,
    required super.intelLevelKey,
  });

  factory SpyfallLocationModel.fromJson(Map<String, dynamic> json) {
    return SpyfallLocationModel(
      id: json['id'] as String,
      titleKey: json['titleKey'] as String,
      intelLevelKey: json['intelLevelKey'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'titleKey': titleKey, 'intelLevelKey': intelLevelKey};
  }
}
