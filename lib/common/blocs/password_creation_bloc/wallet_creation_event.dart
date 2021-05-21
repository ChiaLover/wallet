part of 'wallet_creation_bloc.dart';

@immutable
abstract class WalletCreationEvent {}

class CreatePassCode extends WalletCreationEvent {
  final String passcode;

  CreatePassCode(this.passcode);
}

class ValidPasscode extends WalletCreationEvent {
  final String rePasscode;

  ValidPasscode(this.rePasscode);
}

class CreateWallet extends WalletCreationEvent {
  final String passcode;

  CreateWallet(this.passcode);
}
