import 'package:my_app/app/pages/home/model/home_view_model.dart';
import 'package:my_app/app/widgets/cards/super_hero_card/model/super_hero_model.dart';
import 'package:my_app/core/domain/entities/super_hero/super_hero_entity.dart';

abstract class HomeAdapter {
  HomeAdapter._();

  static HomeViewModel toViewModel(List<SuperHeroEntity> superHeroes) =>
      HomeViewModel(
          superHeroes: superHeroes
              .map(
                (e) => SuperHeroModel(
                    id: e.id,
                    name: e.name,
                    image: e.image.url,
                    intelligence: e.powerStats.intelligence,
                    speed: e.powerStats.speed,
                    strength: e.powerStats.strength,
                    durability: e.powerStats.durability,
                    power: e.powerStats.power,
                    combat: e.powerStats.combat,
                    fullName: e.biography.fullName,
                    alterEgos: e.biography.alterEgos,
                    aliases: e.biography.aliases.join(', '),
                    placeOfBirth: e.biography.placeOrBirth,
                    firstAppearance: e.biography.firstAppearance,
                    publisher: e.biography.publisher,
                    alignment: e.biography.alignment),
              )
              .toList());
}
