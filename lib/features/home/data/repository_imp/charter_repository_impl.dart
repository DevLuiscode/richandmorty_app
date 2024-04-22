import 'package:rick_morty_app/features/home/data/datasource/network/charter_datasource.dart';
import 'package:rick_morty_app/features/home/data/datasource/network/model/charter_result.dart';
import 'package:rick_morty_app/features/home/domain/entities/charter_entity.dart';
import 'package:rick_morty_app/features/home/domain/repository/charter_repository.dart';

class CharterRepositoryImpl extends CharterRepository {
  final CharterDatasource charterDatasource;

  CharterRepositoryImpl({required this.charterDatasource});
  @override
  Future<List<CharterEntity>> fetchCharters() async {
    final List<CharterResult> responseDatasource =
        await charterDatasource.fetchCharters();

    final mapResultoToEntity = responseDatasource
        .map(
          (charter) => CharterEntity(
            id: charter.id.toString(),
            name: charter.name,
            image: charter.image,
            specie: charter.species,
          ),
        )
        .toList();
    return mapResultoToEntity;
  }
}
