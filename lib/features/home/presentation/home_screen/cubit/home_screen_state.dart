part of 'home_screen_cubit.dart';

enum HomeScreenTab {
  transactions('Transactions', Tinkok.graph),
  cashback('Cashback', Tinkok.crown),
  foo('Foo', Icons.telegram),
  bar('Bar', Icons.facebook);

  final String title;
  final IconData icon;
  const HomeScreenTab(this.title, this.icon);
}

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    @Default(0) int selectedAccountIndex,
    @Default(HomeScreenTab.transactions) HomeScreenTab currentTab,
    @Default(HomeScreenTab.transactions) HomeScreenTab previousTab,
    @Default(false) bool scrollingAllowed,
  }) = _HomeScreenState;
}
