import 'package:equatable/equatable.dart';

class ByCharterEntity extends Equatable {
  final String name;
  final String status;
  final String specie;
  final String gender;
  final String image;
  final String create;

  const ByCharterEntity({
    required this.name,
    required this.status,
    required this.specie,
    required this.gender,
    required this.image,
    required this.create,
  });

  @override
  List<Object?> get props => [name, status, specie, gender, image, create];
}
