import 'package:app_visao_artificial/data/sources/background_service.dart';
import 'package:app_visao_artificial/domain/use_cases/detection_use_cases.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetectionCubit extends Cubit<void> {
  final DetectionUseCases detectionUseCases;

  DetectionCubit(this.detectionUseCases) : super(null);

  Future<void> initMonitoramento() async {
    bool background = await BackgroundServiceHelper.iniciarServicoBackground();

    if (background) {
      detectionUseCases();
    } else {
      print('Não foi possivel iniciar processamento em segundo plano');
    }
  }

  @override
  Future<void> close() {
    BackgroundServiceHelper.pararServicoBackground();
    return super.close();
  }
}
