import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wallet_detail_event.dart';
part 'wallet_detail_state.dart';

class WalletDetailBloc extends Bloc<WalletDetailEvent, WalletDetailState> {
  WalletDetailBloc() : super(WalletDetailInitial());

  @override
  Stream<WalletDetailState> mapEventToState(
    WalletDetailEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
