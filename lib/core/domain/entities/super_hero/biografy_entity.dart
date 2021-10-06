import 'package:meta/meta.dart';

@immutable
class BiographyEntity {
  final String fullName;
  final String alterEgos;
  final List<String> aliases;
  final String placeOrBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;

  const BiographyEntity({
    required this.fullName,
    required this.alterEgos,
    required this.aliases,
    required this.placeOrBirth,
    required this.firstAppearance,
    required this.publisher,
    required this.alignment,
  });
}
