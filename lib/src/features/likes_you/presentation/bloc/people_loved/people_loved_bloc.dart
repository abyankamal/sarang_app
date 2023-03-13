import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sarang_app/src/features/likes_you/data/data_match_dummy.dart';
import 'package:sarang_app/src/features/likes_you/domain/user.dart';

part 'people_loved_event.dart';
part 'people_loved_state.dart';

class PeopleLovedBloc extends Bloc<PeopleLovedEvent, PeopleLovedState> {
  PeopleLovedBloc() : super(PeopleLovedInitial()) {
    on<OnEventLOvedEventCalled>((event, emit) async {
      emit(PeopleLovedLoading());
      await Future.delayed(Duration(seconds: 1));
      emit(PeopleLovedLoaded(userMatch: dataMatchDummy));
    });

    on<AddPeopleLoved>((event, emit) async {
      emit(PeopleLovedLoading());
      dataMatchDummy.add(event.user);
      emit(PeopleLovedLoaded(userMatch: dataMatchDummy));
    });
  }
}
