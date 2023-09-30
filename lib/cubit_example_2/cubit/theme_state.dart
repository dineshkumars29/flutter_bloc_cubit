part of 'theme_cubit.dart';

enum AppTheme { light, dark }

class ThemeState extends Equatable {
  final AppTheme Clickme;
  ThemeState({
    required this.Clickme,
  });

  factory ThemeState.initial() {
    return ThemeState(Clickme: AppTheme.light);
  }

  @override
  List<Object?> get props => [Clickme];

  @override
  String toString() => 'ThemeState(Clickme: $Clickme)';

  ThemeState copyWith({
    AppTheme? Clickme,
  }) {
    return ThemeState(
      Clickme: Clickme ?? this.Clickme,
    );
  }
}
