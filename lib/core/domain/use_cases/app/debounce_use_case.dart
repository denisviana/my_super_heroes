import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:my_app/core/domain/use_cases/base/base_use_case.dart';

@injectable
class DebounceUseCase extends BaseSimpleUseCase<Function(), Timer> {
  @override
  Timer call(Function() params) =>
      Timer(const Duration(milliseconds: 500), params);
}
