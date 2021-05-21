part of 'wallet_creation_bloc.dart';

@immutable
abstract class WalletCreationState {}

class ErrorState extends WalletCreationState {
  final String message;

  ErrorState(this.message);
}

class PassCodeCreation extends WalletCreationState {}

class PassCodeValidation extends WalletCreationState {
  final String passcode;

  PassCodeValidation(this.passcode);
}

class WrongPasscode extends WalletCreationState {}

class Creating extends WalletCreationState {}

class WalletCreateSuccess extends WalletCreationState {}

class WalletCreateFailure extends WalletCreationState {}
