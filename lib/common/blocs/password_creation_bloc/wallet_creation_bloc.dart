import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chia_wallet/core/utils/config.dart';
import 'package:chia_wallet/core/utils/log.dart';
import 'package:meta/meta.dart';

part 'wallet_creation_event.dart';

part 'wallet_creation_state.dart';

class WalletCreationBloc
    extends Bloc<WalletCreationEvent, WalletCreationState> {
  String passCode = "";

  WalletCreationBloc() : super(PassCodeCreation());

  @override
  Stream<WalletCreationState> mapEventToState(
    WalletCreationEvent event,
  ) async* {
    switch (event.runtimeType) {
      case CreatePassCode:
        yield* _handleCreatePassword(event as CreatePassCode);
        break;
      case ValidatePasscode:
        yield* _handleValidPassword(event as ValidatePasscode);
        break;
      case CreateWallet:
        yield* _handleCreateWallet(event as CreateWallet);
        break;
    }
  }

  Stream<WalletCreationState> _handleCreatePassword(
      CreatePassCode event) async* {
    try {
      _savePassword(event.passcode);
      yield PassCodeValidation(event.passcode);
    } catch (ex) {
      Log.error(ex);
      yield ErrorState(Config.getString("msm_unknown_error") ?? "Error!");
    }
  }

  Stream<WalletCreationState> _handleValidPassword(ValidatePasscode event) async* {
    try {
      bool correctPasscode = checkPasscode(event.rePasscode);
      if (correctPasscode) {
        add(CreateWallet(passCode));
      } else {
        yield WrongPasscode();
      }
    } catch (ex) {
      Log.error(ex);
      yield ErrorState(Config.getString("msm_unknown_error") ?? "Error!");
    }
  }

  Stream<WalletCreationState> _handleCreateWallet(CreateWallet event) async* {
    try {
      yield Creating();
      //TODO: API creation Wallet
      sleep(Duration(seconds: 2));
      yield WalletCreateSuccess();
    } catch (ex) {
      //TODO: catch when creation wallet fail
      switch (ex.runtimeType) {
        default:
          yield WalletCreateFailure();
      }
    }
  }

  void _savePassword(String passcode) {
    this.passCode = passcode;
  }

  bool checkPasscode(String rePasscode) {
    return this.passCode == rePasscode;
  }
}
