import 'package:equatable/equatable.dart';

import '../../../data/model/resource.dart';

abstract class BaseFutureResourceUseCase<Param, Result> extends BaseUseCase {
  Future<Resource<Result?>> call(Param params);
}

abstract class BaseFutureUseCase<Param, Result> extends BaseUseCase {
  Future<Result?> call(Param params);
}

abstract class BaseSimpleUseCase<Param, Result> extends BaseUseCase {
  Result call(Param params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}

abstract class BaseStreamResourceUseCase<Param, Result> extends BaseUseCase {
  Stream<Resource<Result?>> call(Param params);
}

abstract class BaseStreamUseCase<Param, Result> extends BaseUseCase {
  Stream<Result> call(Param params);
}

abstract class BaseUseCase {}
