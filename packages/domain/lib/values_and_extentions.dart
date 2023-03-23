import 'package:json_annotation/json_annotation.dart';

enum SoilType {
  @JsonValue("sandy")
  sandy,
  @JsonValue("sandy_loam")
  sandyLoam,
  @JsonValue("clay")
  clay,
  @JsonValue("loamy")
  loamy,
  @JsonValue("calcareous")
  calcareous,
  @JsonValue("peaty")
  peaty,
  @JsonValue("black_soil")
  blackSoil,
  @JsonValue("others")
  others
}

enum PlantType {
  @JsonValue("Trees")
  trees,
  @JsonValue("Fruit trees")
  fruitTrees,
  @JsonValue("Shrubs")
  shrubs,
  @JsonValue("Vines")
  vines,
  @JsonValue("Grasses")
  grasses,
  @JsonValue("Ferns")
  ferns,
  @JsonValue("Mosses")
  mosses,
  @JsonValue("Algae")
  algae,
  @JsonValue("Lichens")
  lichens,
  @JsonValue("Succulents")
  succulents,
  @JsonValue("Aquatic plants")
  aquaticPlants,
  @JsonValue("Epiphytes")
  epiphytes,
  @JsonValue("Annuals")
  annuals,
  @JsonValue("Biennials")
  biennials,
  @JsonValue("Perennials")
  perennials,
  @JsonValue("Bulbs")
  bulbs,
  @JsonValue("Cacti")
  cacti,
  @JsonValue("Carnivorous plants")
  carnivorousPlants,
  @JsonValue("deciduousPlants")
  deciduousPlants,
  @JsonValue("Evergreen plants")
  evergreenPlants
}
