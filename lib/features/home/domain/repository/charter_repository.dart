import 'package:rick_morty_app/features/home/domain/entities/charter_entity.dart';

abstract class CharterRepository {
  Future<List<CharterEntity>> fetchCharters({required int page});
}
