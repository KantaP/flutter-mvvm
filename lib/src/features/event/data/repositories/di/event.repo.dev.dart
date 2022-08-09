

import 'package:injectable/injectable.dart';
import 'package:prototype/src/constants/api.dart';
import 'package:prototype/src/data/network/dio_client.dart';
import 'package:prototype/src/di/components/injection.dart';
import 'package:prototype/src/features/event/data/repositories/event.repo.dart';

@Environment(Env.development)
@Injectable(as: EventRepository)
class EventRepositoryDev extends EventRepository {
  EventRepositoryDev()
      : super(
          getIt<DioClient>(),
          ApiConstant.baseUrl,
        );
}