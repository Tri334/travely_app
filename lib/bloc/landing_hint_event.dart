part of 'landing_hint_bloc.dart';

abstract class LandingHintEvent extends Equatable {
  const LandingHintEvent(this.page);
  final int page;

  @override
  List<Object> get props => [page];
}

class EventPageChange extends LandingHintEvent {
  const EventPageChange(super.page);
  @override
  List<Object> get props => [page];
}
