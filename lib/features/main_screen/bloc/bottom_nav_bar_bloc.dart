import 'package:flutter_bloc/flutter_bloc.dart';

abstract class BottomNavBarEvent {}

class BottomNavBarChangedIndex extends BottomNavBarEvent {
  BottomNavBarChangedIndex({required this.index});

  final int index;
}

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, int> {
  BottomNavBarBloc() : super(0) {
    on<BottomNavBarChangedIndex>((event, emit) {
      emit(event.index);
    });
  }
}
