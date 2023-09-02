class HomeState {
  const HomeState({
    this.index = 0,
  });

  final int index;

  HomeState copyWith({int? index}) => HomeState(index: index ?? this.index);
}
