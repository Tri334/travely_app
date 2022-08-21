part of 'verify_cubit.dart';

class VerifyState extends Equatable {
  const VerifyState(
      {this.timer = const Duration(seconds: 15), this.enable = false});
  final Duration timer;
  final bool enable;

  VerifyState copyWith({Duration? timer, bool? enable}) {
    return VerifyState(
        timer: timer ?? this.timer, enable: enable ?? this.enable);
  }

  @override
  List<Object> get props => [timer, enable];
}
