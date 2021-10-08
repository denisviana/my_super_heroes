import 'dart:async';

import 'package:get/get.dart';
import 'package:my_app/app/pages/home/adapter/home_adapter.dart';
import 'package:my_app/app/pages/home/model/home_view_model.dart';
import 'package:my_app/core/data/enum/status.dart';
import 'package:my_app/core/data/model/app_exception.dart';
import 'package:my_app/core/data/model/resource.dart';
import 'package:my_app/core/domain/entities/super_hero/super_hero_entity.dart';
import 'package:my_app/core/domain/use_cases/app/debounce_use_case.dart';
import 'package:my_app/core/domain/use_cases/super_heroes/search_super_heroes_by_name_use_case.dart';

class HomeController extends GetxController {
  HomeController(
    this._searchSuperHeroesByNameUseCase,
    this._debounceUseCase,
  );

  //region Use Cases
  final SearchSuperHeroesByNameUseCase _searchSuperHeroesByNameUseCase;
  final DebounceUseCase _debounceUseCase;

//endregion

  //region State
  final state =
      Resource.success<HomeViewModel>(data: HomeViewModel(superHeroes: [])).obs;

  //endregion

//region Variables
  Timer? _debounce;

//endregion

//region Functions
  void onTextChanged(String text) {

    _shouldCancelDebounce();

    _debounce = _debounceUseCase(() async {
      state.value = Resource.loading();
      final response = await _searchSuperHeroesByNameUseCase(text);
      switch (response.status) {
        case Status.loading:
          break;
        case Status.success:
          _handleSuccess(response.data ?? []);
          break;
        case Status.failed:
          _handleError(
            exception:
                response.error ?? AppException(title: '', description: ''),
          );
          break;
      }
    });
  }

  void _handleSuccess(List<SuperHeroEntity> superHeroes) {
    state.value = Resource.success(
      data: HomeAdapter.toViewModel(superHeroes),
    );
  }

  void _handleError({AppException? exception}) {
    state.value = Resource.failed(error: exception);
  }

  void _shouldCancelDebounce() {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
  }

  @override
  void onClose() {
    super.onClose();
    _debounce?.cancel();
  }
//endregion

}
