import 'package:rick_morty_app/features/details/data/datasources/network/detail_datasource.dart';
import 'package:rick_morty_app/features/details/domain/entities/by_charter_entity.dart';
import 'package:rick_morty_app/features/details/domain/repository/detail_repository.dart';

class DetailRepositoryImpl extends DetailRepository {
  final DetailDatasource detailDatasource;

  DetailRepositoryImpl({required this.detailDatasource});

  @override
  Future<ByCharterEntity> fetchByIdCharter({required int id}) async {
    final responseDatasource = await detailDatasource.fetchIdCharter(id);

    final charterEntity = ByCharterEntity(
      name: responseDatasource.name,
      status: responseDatasource.status,
      specie: responseDatasource.species,
      gender: responseDatasource.gender,
      image: responseDatasource.image,
      create: responseDatasource.created.toString(),
    );

    return charterEntity;
  }
}
