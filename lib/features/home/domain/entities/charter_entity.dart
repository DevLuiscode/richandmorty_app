class CharterEntity {
  final String id;
  final String name;
  final String image;
  final String specie;

  CharterEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.specie,
  });

  CharterEntity copyWith({
    String? id,
    String? name,
    String? image,
    String? specie,
  }) =>
      CharterEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        specie: specie ?? this.specie,
      );
}
