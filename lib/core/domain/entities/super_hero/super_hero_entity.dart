import 'package:meta/meta.dart';
import 'package:radio_life/core/domain/entities/super_hero/appearance_entity.dart';
import 'package:radio_life/core/domain/entities/super_hero/biografy_entity.dart';
import 'package:radio_life/core/domain/entities/super_hero/connections_entity.dart';
import 'package:radio_life/core/domain/entities/super_hero/image_entity.dart';
import 'package:radio_life/core/domain/entities/super_hero/power_stats_entity.dart';
import 'package:radio_life/core/domain/entities/super_hero/work_entity.dart';

@immutable
class SuperHeroEntity {
  final String id;
  final String name;
  final PowerStatsEntity powerStats;
  final BiographyEntity biography;
  final AppearanceEntity appearance;
  final WorkEntity work;
  final ConnectionsEntity connections;
  final ImageEntity image;

  const SuperHeroEntity({
    required this.id,
    required this.name,
    required this.powerStats,
    required this.biography,
    required this.appearance,
    required this.work,
    required this.connections,
    required this.image,
  });
}
