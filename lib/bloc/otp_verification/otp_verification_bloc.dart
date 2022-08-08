import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'otp_verification_event.dart';
part 'otp_verification_state.dart';

class OtpVerificationBloc
    extends Bloc<OtpVerificationEvent, OtpVerificationState> {
  OtpVerificationBloc() : super(const OtpVerificationInitial(counter: 10)) {
    on<EventOtpInit>((event, emit) {
      return emit(OtpVerificationInitial(counter: event.counter));
    });
    on<EventOtpDecrement>((event, emit) {
      return emit(OtpVerificationInitial(counter: state.counter - 1));
    });
    on<EventGetNewCode>((event, emit) {
      return emit(const OtpVerificationInitial(counter: 10));
    });
    on<EventGetNewCodeEmail>((event, emit) {
      return emit(const OtpVerificationInitial(counter: 15));
    });
  }
  @override
  void onChange(Change<OtpVerificationState> change) {
    // TODO: implement onChange
    super.onChange(change);
    print(change);
  }
}
