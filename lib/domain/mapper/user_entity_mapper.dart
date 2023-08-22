import 'package:intl/intl.dart';
import 'package:lseg/data/data.dart';
import 'package:lseg/domain/domain.dart';

class UserEntityMapper extends Mapper<UserEntity?, UserModel?> {
  final dobFormat = "yyyy-MM-dd";
  @override
  UserModel? toDomain(UserEntity? entity) {
    return entity == null
        ? null
        : UserModel(
            name: entity.name,
            userId: entity.userId,
            userName: entity.userName,
            profileUrl: entity.profileUrl,
            localProfile: entity.localProfile,
            phone: entity.phone,
            email: entity.email,
            bio: entity.bio,
            city: entity.city,
            contentIds: entity.contents,
            favourites: entity.favourites,
            gender: entity.gender,
            occupation: entity.occupation,
            currentBalance: entity.currentBalance,
            country: entity.country,
            course: entity.course,
            dob: entity.dob != null
                ? DateFormat(dobFormat).parse(entity.dob!)
                : null);
  }

  @override
  UserEntity? fromDomain(UserModel? domain) {
    return domain == null
        ? null
        : UserEntity(
            name: domain.name,
            userId: domain.userId,
            userName: domain.userName,
            profileUrl: domain.profileUrl,
            localProfile: domain.localProfile,
            phone: domain.phone,
            email: domain.email,
            bio: domain.bio,
            city: domain.city,
            contents: domain.contentIds,
            favourites: domain.favourites,
            gender: domain.gender,
            occupation: domain.occupation,
            currentBalance: domain.currentBalance,
            country: domain.country,
            course: domain.course,
            dob: domain.dob == null
                ? null
                : DateFormat(dobFormat).format(domain.dob!));
  }
}
