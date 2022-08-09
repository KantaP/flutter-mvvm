import 'package:injectable/injectable.dart';
import 'package:prototype/src/di/components/injection.dart';
import 'package:prototype/src/features/authenticate/data/repositories/authentication.repo.dart';

@Environment(Env.stagging)
@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryStag extends AuthenticationRepository {
  AuthenticationRepositoryStag(super.userDataSource);
}