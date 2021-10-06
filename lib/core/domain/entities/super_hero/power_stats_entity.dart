import 'package:meta/meta.dart';

@immutable
class PowerStatsEntity {
  final String intelligence;
  final String strength;
  final String speed;
  final String durability;
  final String power;
  final String combat;

  const PowerStatsEntity({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });
}
