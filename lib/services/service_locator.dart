import 'package:get_it/get_it.dart';
import 'package:pp_28/services/remote_config_service.dart';
import '../logic/operations_controller.dart';
import '../storage/storage_service.dart';
import 'data_base.dart';
import 'event_bus.dart';
import 'network_service.dart';


class ServiceLocator {
  final _getIt = GetIt.instance;
  Future<void> setup() async {
    final storageService = StorageService();
    _getIt.registerSingleton<StorageService>(storageService);
    await storageService.init();
    _getIt.registerSingletonAsync(()=> RemoteConfigService().init());
    await _getIt.isReady<RemoteConfigService>();
    final dataBase = DataBase();
    _getIt.registerSingleton<DataBase>(dataBase);
    await dataBase.init();
    _getIt.registerSingleton<OperationController>(OperationController());
    _getIt.registerSingleton<NetworkService>(NetworkService());
    _getIt.registerSingleton<EventBus>(EventBus());
  }
}
