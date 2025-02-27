import 'package:pass_king/shared/settings/settings_repo.dart';

import '../generic_cubit/generic_cubit.dart';
import '../models/failure.dart';

class SettingsViewModel {
  GenericCubit<Map<String, dynamic>?> settingsCubit = GenericCubit(null);

  SettingsRepo repo = SettingsRepo();

  getSettings() async {
    settingsCubit.onLoadingState();
    try {
      final result = await repo.getSettings();
      settingsCubit.onUpdateData(result['data']);
    } on Failure catch (failure) {
      settingsCubit.onErrorState(failure);
    }
  }
}
