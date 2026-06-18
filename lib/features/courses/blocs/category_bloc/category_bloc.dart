import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:teaching_lms_adv/core/blocs/base_state/base.dart';
import 'package:teaching_lms_adv/features/courses/model/category_model.dart';

import 'package:teaching_lms_adv/features/courses/repositories/category_repository.dart';

part 'category_event.dart';
part 'category_state.dart';
part 'category_bloc.freezed.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _repo;

  CategoryBloc({required CategoryRepository repo})
    : _repo = repo,
      super(CategoryState.initial()) {
    on<_Get>(_onGet);
  }

  Future<void> _onGet(_Get event, Emitter<CategoryState> emit) async {
    emit(CategoryState.loading());
    final result = await _repo.getCategories();
    result.fold(
      (l) => emit(CategoryState.failure(l)),
      (r) => emit(CategoryState.loaded(r)),
    );
  }
}
