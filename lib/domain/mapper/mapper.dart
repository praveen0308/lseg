export 'user_entity_mapper.dart';

abstract class Mapper<E, D> {
  D toDomain(E entity);
  E fromDomain(D domain);
}