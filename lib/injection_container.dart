import 'package:app_visao_artificial/data/repositorys/detection_repository.dart';
import 'package:app_visao_artificial/data/repositorys/speech_repository.dart';
import 'package:app_visao_artificial/data/sources/detection_data_source.dart';
import 'package:app_visao_artificial/data/sources/speech_data_source.dart';
import 'package:app_visao_artificial/domain/repositories/detection_repository.dart';
import 'package:app_visao_artificial/domain/use_cases/detection_use_cases.dart';
import 'package:app_visao_artificial/presentation/cubit/detection_cubit.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get_it/get_it.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:app_visao_artificial/domain/repositories/speech_repository.dart';

final sl = GetIt.instance;

void initDependencies() {
  sl.registerLazySingleton(() => FlutterTts());
  
  sl.registerLazySingleton(
    () => WebSocketChannel.connect(
      Uri.parse(
        dotenv.get('API_URL'),
      ),
    ),
  );
  sl.registerLazySingleton(() => WebSocketChannelDataSource(sl()));
  sl.registerLazySingleton(() => SpeechDataSource());

  sl.registerLazySingleton<DetectionRepository>(
    () => DetectionRepositoryImpl(sl()),
  );
  sl.registerLazySingleton<SpeechRepository>(() => SpeechRepositoryImpl(sl()));

  sl.registerLazySingleton(() => DetectionUseCases(sl(), sl()));

  sl.registerLazySingleton(() => DetectionCubit(sl()));
}
