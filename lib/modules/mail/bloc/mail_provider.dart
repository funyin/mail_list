import 'package:mail_list/core/data/domain/app_error.dart';
import 'package:mail_list/core/data/domain/ui_state.dart';
import 'package:mail_list/core/di/di.dart';
import 'package:mail_list/modules/mail/data/mail_api.dart';
import 'package:mail_list/modules/mail/models/mail.dart';
import 'package:riverpod/riverpod.dart';

final mailProvider =
    StateNotifierProvider.autoDispose<MailNotifier, MailState>((ref) {
  return MailNotifier();
});

class MailNotifier extends StateNotifier<MailState> {
  MailNotifier() : super(const MailState());
  final _api = MailApi(getIt.get());

  getMails() async {
    try {
      state = state.copyWith(mails: UiState.loading());
      final response = await _api.mails();
      state = state.copyWith(mails: UiState.success(response));
    } catch (e) {
      state = state.copyWith(mails: UiState.error(AppError(e).message));
    }
  }
}

class MailState {
  final UiState<List<Mail>> mails;

  const MailState({
    this.mails = const UiStateInitial(),
  });

  MailState copyWith({
    UiState<List<Mail>>? mails,
  }) {
    return MailState(
      mails: mails ?? this.mails,
    );
  }
}
