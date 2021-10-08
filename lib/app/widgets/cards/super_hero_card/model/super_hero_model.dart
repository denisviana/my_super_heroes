class SuperHeroModel {
  final String id;
  final String name;
  final String image;
  final String intelligence;
  final String speed;
  final String strength;
  final String durability;
  final String power;
  final String combat;
  final String fullName;
  final String alterEgos;
  final String aliases;
  final String placeOfBirth;
  final String firstAppearance;
  final String publisher;
  final String alignment;

  SuperHeroModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.intelligence,
      required this.speed,
      required this.strength,
      required this.durability,
      required this.power,
      required this.combat,
      required this.fullName,
      required this.alterEgos,
      required this.aliases,
      required this.placeOfBirth,
      required this.firstAppearance,
      required this.publisher,
      required this.alignment});
}
