part of 'home_screen_cubit.dart';

enum HomeScreenTab {
  transactions('Transactions', Tinkok.graph),
  cashback('Cashback', Tinkok.crown);

  final String title;
  final IconData icon;
  const HomeScreenTab(this.title, this.icon);
}

@freezed
class HomeScreenState with _$HomeScreenState {
  const factory HomeScreenState({
    required HomeScreenTab currentTab,
  }) = _HomeScreenState;

  factory HomeScreenState.initial() {
    return const HomeScreenState(
      currentTab: HomeScreenTab.transactions,
    );
  }
}
