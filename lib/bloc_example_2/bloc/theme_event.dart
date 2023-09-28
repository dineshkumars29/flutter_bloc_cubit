part of 'theme_bloc.dart';

sealed class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  bool isClick;
  ChangeThemeEvent({
    required this.isClick,
  });

  @override
  String toString() => 'ChangeThemeEvent(isClick: $isClick)';

  @override
  List<Object> get props => [isClick];
}
