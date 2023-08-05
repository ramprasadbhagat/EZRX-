import 'dart:async';

import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/domain/chatbot/repository/i_chatbot_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_bot_event.dart';
part 'chat_bot_state.dart';
part 'chat_bot_bloc.freezed.dart';

class ChatBotBloc extends Bloc<ChatBotEvent, ChatBotState> {
  final IChatBotRepository repository;

  ChatBotBloc({
    required this.repository,
  }) : super(const ChatBotState.initialized()) {
    on<ChatBotEvent>(_onEvent);
  }

  Future<void> _onEvent(
    ChatBotEvent event,
    Emitter<ChatBotState> emit,
  ) async {
    await event.map(
      initialize: (_) async => emit(const ChatBotState.initialized()),
      startChatbot: (_) async {
        emit(const ChatBotState.loading());
        final failureOrSuccess = await repository.startChatbot();
        failureOrSuccess.fold(
          (error) => emit(
            ChatBotState.error(error),
          ),
          (_) => emit(
            const ChatBotState.start(),
          ),
        );
      },
      resetChatbot: (_) async {
        emit(const ChatBotState.loading());
        final failureOrSuccess = await repository.resetChatbot();
        failureOrSuccess.fold(
          (error) => emit(
            ChatBotState.error(error),
          ),
          (_) => emit(
            const ChatBotState.reset(),
          ),
        );
      },
    );
  }
}
