import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState.initial());

  void changeTheme(int readInt) {
    if (readInt % 2 == 0) {
      emit(state.copyWith(Clickme: AppTheme.light));
    } else {
      emit(state.copyWith(Clickme: AppTheme.dark));
    }
  }
}
