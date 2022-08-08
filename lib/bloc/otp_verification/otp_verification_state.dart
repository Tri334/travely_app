part of 'otp_verification_bloc.dart';

abstract class OtpVerificationState extends Equatable {
  const OtpVerificationState({this.counter = 10});
  final int counter;

  @override
  List<Object> get props => [counter];
}

class OtpVerificationInitial extends OtpVerificationState {
  const OtpVerificationInitial({required super.counter});
  @override
  List<Object> get props => [counter];
}
