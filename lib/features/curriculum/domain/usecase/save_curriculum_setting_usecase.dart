import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/curriculum_setting.dart';
import '../repositories/curriculum_repository.dart';

@injectable
class SaveCurriculumSettingUsecase implements UseCase<Unit, Params> {
  final CurriculumRepository repository;

  SaveCurriculumSettingUsecase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(Params params) async {
    return repository.saveCurriculumSetting(setting: params.setting);
  }
}

class Params extends Equatable {
  final CurriculumSetting setting;

  const Params({
    @required this.setting,
  });

  @override
  List<Object> get props => [setting];
}
