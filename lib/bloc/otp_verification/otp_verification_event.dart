part of 'otp_verification_bloc.dart';

abstract class OtpVerificationEvent extends Equatable {
  const OtpVerificationEvent(this.counter);
  final int counter;

  @override
  List<Object> get props => [counter];
}

class EventOtpInit extends OtpVerificationEvent {
  const EventOtpInit(super.counter);
  @override
  List<Object> get props => [counter];
}

class EventOtpDecrement extends OtpVerificationEvent {
  const EventOtpDecrement(super.counter);
  @override
  List<Object> get props => [counter];
}

class EventOtpDecrementEmail extends OtpVerificationEvent {
  const EventOtpDecrementEmail(super.counter);
  @override
  List<Object> get props => [counter];
}

class EventGetNewCode extends OtpVerificationEvent {
  const EventGetNewCode(super.counter);
  @override
  List<Object> get props => [counter];
}

class EventGetNewCodeEmail extends OtpVerificationEvent {
  const EventGetNewCodeEmail(super.counter);
  @override
  List<Object> get props => [counter];
}
