import 'package:injectable/injectable.dart';
import 'package:prototype/src/di/components/injection.dart';
import 'package:prototype/src/features/authenticate/data/repositories/authentication.repo.dart';

@Environment(Env.production)
@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryProd extends AuthenticationRepository {
  AuthenticationRepositoryProd(super.userDataSource);
}