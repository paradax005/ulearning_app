abstract class HomeEvent {
  const HomeEvent();
}

class HomeDots extends HomeEvent {
  HomeDots(this.index);
  final int index;
}
