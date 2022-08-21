import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travely_app/models/landing_model.dart';

part 'landing_hint_event.dart';
part 'landing_hint_state.dart';

class LandingHintBloc extends Bloc<LandingHintEvent, String> {
  LandingHintBloc() : super('Skip') {
    on<EventPageChange>((event, emit) {
      event.page != landingContent.length - 1 ? emit('Skip') : emit('Done');
    });
  }
  @override
  void onChange(Change<String> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
