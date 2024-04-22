import 'package:rick_morty_app/features/details/domain/entities/by_charter_entity.dart';

abstract class DetailRepository {
  Future<ByCharterEntity> fetchByIdCharter({required int id});
}
