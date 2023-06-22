part of 'chat_bot_bloc.dart';

@freezed
class ChatBotState with _$ChatBotState {
  const factory ChatBotState.initialized() = _Initialized;
  const factory ChatBotState.start() = _Start;
  const factory ChatBotState.loading() = _Loading;
  const factory ChatBotState.reset() = _Reset;
  const factory ChatBotState.error(ApiFailure failure) = _Error;
}
