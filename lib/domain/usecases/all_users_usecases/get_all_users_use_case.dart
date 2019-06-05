import 'package:chat_app/domain/models/user_model.dart';
import 'package:chat_app/domain/repositories/user_repository.dart';
import 'package:chat_app/domain/usecases/base_reactive_use_case.dart';

class GetAllUsersUseCase implements BaseReactiveUseCase<List<UserModel>> {
  UserRepository userRepository;

  GetAllUsersUseCase(this.userRepository);

  @override
  Stream<List<UserModel>> perform() {
    return this.userRepository.getAll();
  }
}
