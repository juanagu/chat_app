import 'package:chat_app/data/datasources/UserFirebaseDataSource.dart';
import 'package:chat_app/data/repositories/user_repository_impl.dart';
import 'package:chat_app/domain/repositories/user_repository.dart';
import 'package:chat_app/domain/usecases/all_users_usecases/get_all_users_use_case.dart';
import "package:dependencies/dependencies.dart";

class UserModule implements Module {
  @override
  void configure(Binder binder) {
    binder
      ..bindLazySingleton<UserRepository>((i, p) => UserFirebaseDataSource(),
          name: "user_firebase_data_source")
      ..bindLazySingleton<UserRepository>(
          (i, p) => UserRepositoryImpl(
              i.get<UserRepository>(name: "user_firebase_data_source")),
          name: "user_repository")
      ..bindFactory<GetAllUsersUseCase>((i, p) =>
          GetAllUsersUseCase(i.get<UserRepository>(name: "user_repository")));
  }
}
