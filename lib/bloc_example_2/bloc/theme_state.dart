part of 'theme_bloc.dart';

enum Apptheme { light, dark }

class ThemeState extends Equatable {
  final Apptheme theme;
  ThemeState({
    this.theme = Apptheme.light,
  });

  factory ThemeState.initial() {
    return ThemeState();
  }
  @override
  String toString() => 'Theme(theme: $theme)';

  ThemeState copyWith({
    Apptheme? theme,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
    );
  }

  @override
  List<Object?> get props => [theme];
}
