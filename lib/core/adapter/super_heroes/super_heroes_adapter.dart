import 'package:my_app/core/domain/entities/super_hero/appearance_entity.dart';
import 'package:my_app/core/domain/entities/super_hero/biografy_entity.dart';
import 'package:my_app/core/domain/entities/super_hero/connections_entity.dart';
import 'package:my_app/core/domain/entities/super_hero/image_entity.dart';
import 'package:my_app/core/domain/entities/super_hero/power_stats_entity.dart';
import 'package:my_app/core/domain/entities/super_hero/super_hero_entity.dart';
import 'package:my_app/core/domain/entities/super_hero/work_entity.dart';

abstract class SuperHeroesResponseAdapter {
  static List<SuperHeroEntity> fromJsonList(
          List<Map<String, dynamic>> jsonList) =>
      jsonList.map((e) => fromJson(e)).toList();

  static SuperHeroEntity fromJson(Map<String, dynamic> json) => SuperHeroEntity(
        id: json['id'] ?? '',
        name: json['name'] ?? '',
        powerStats: PowerStatsEntity(
          strength: json['powerstats']['strength'] ?? '',
          power: json['powerstats']['power'] ?? '',
          durability: json['powerstats']['durability'] ?? '',
          speed: json['powerstats']['speed'] ?? '',
          combat: json['powerstats']['combat'] ?? '',
          intelligence: json['powerstats']['intelligence'] ?? '',
        ),
        biography: BiographyEntity(
          fullName: json['biography']['full-name'] ?? '',
          alterEgos: json['biography']['alter-egos'] ?? '',
          aliases: List<String>.from(json['biography']['aliases'] ?? []),
          placeOrBirth: json['biography']['place-of-birth'] ?? '',
          firstAppearance: json['biography']['first-appearance'] ?? '',
          publisher: json['biography']['publisher'] ?? '',
          alignment: json['biography']['alignment'] ?? '',
        ),
        appearance: AppearanceEntity(
          gender: json['appearance']['gender'] ?? '',
          race: json['appearance']['race'] ?? '',
          eyeColor: json['appearance']['eye-color'] ?? '',
          hairColor: json['appearance']['hair-color'] ?? '',
          height: List<String>.from(json['appearance']['height'] ?? []),
          weight: List<String>.from(json['appearance']['weight'] ?? []),
        ),
        work: WorkEntity(
          occupation: json['work']['occupation'] ?? '',
          base: json['work']['base'] ?? '',
        ),
        connections: ConnectionsEntity(
            groupAffiliation: json['work']['group-affiliation'] ?? '',
            relatives: json['work']['relatives'] ?? ''),
        image: ImageEntity(url: json['image']['url']),
      );
}
