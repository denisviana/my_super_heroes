
import 'package:meta/meta.dart';

@immutable
class AppearanceEntity {
  final String gender;
  final String race;
  final String eyeColor;
  final String hairColor;
  final List<String> height;
  final List<String> weight;

  const AppearanceEntity(
      {required this.gender,
      required this.race,
      required this.eyeColor,
      required this.hairColor,
      required this.height,
      required this.weight});
}
