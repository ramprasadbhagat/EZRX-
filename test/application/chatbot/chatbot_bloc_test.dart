import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/infrastructure/chatbot/repository/chatbot_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ChatBotRepositoryMock extends Mock implements ChatBotRepository {}

void main() {
  final chatBotRepositoryMock = ChatBotRepositoryMock();

  group('Chatbot Bloc', () {
    blocTest(
      'Initialize',
      build: () => ChatBotBloc(repository: chatBotRepositoryMock),
      act: (ChatBotBloc bloc) => bloc.add(const ChatBotEvent.initialize()),
      expect: () => [const ChatBotState.initialized()],
    );

    blocTest(
      'Start chat bot success',
      build: () => ChatBotBloc(repository: chatBotRepositoryMock),
      act: (ChatBotBloc bloc) => bloc.add(const ChatBotEvent.startChatbot()),
      setUp: () {
        when(() => chatBotRepositoryMock.startChatbot()).thenAnswer(
          (invocation) async => const Right(true),
        );
      },
      expect: () => [
        const ChatBotState.loading(),
        const ChatBotState.start(),
      ],
    );

    blocTest(
      'Start chat bot failure',
      build: () => ChatBotBloc(repository: chatBotRepositoryMock),
      act: (ChatBotBloc bloc) => bloc.add(const ChatBotEvent.startChatbot()),
      setUp: () {
        when(() => chatBotRepositoryMock.startChatbot()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Repo error')),
        );
      },
      expect: () => [
        const ChatBotState.loading(),
        const ChatBotState.error(ApiFailure.other('Repo error')),
      ],
    );

    blocTest(
      'Reset chat bot success',
      build: () => ChatBotBloc(repository: chatBotRepositoryMock),
      act: (ChatBotBloc bloc) => bloc.add(const ChatBotEvent.resetChatbot()),
      setUp: () {
        when(() => chatBotRepositoryMock.resetChatbot()).thenAnswer(
          (invocation) async => const Right(true),
        );
      },
      expect: () => [
        const ChatBotState.loading(),
        const ChatBotState.reset(),
      ],
    );

    blocTest(
      'Reset chat bot failure',
      build: () => ChatBotBloc(repository: chatBotRepositoryMock),
      act: (ChatBotBloc bloc) => bloc.add(const ChatBotEvent.resetChatbot()),
      setUp: () {
        when(() => chatBotRepositoryMock.resetChatbot()).thenAnswer(
          (invocation) async => const Left(ApiFailure.other('Repo error')),
        );
      },
      expect: () => [
        const ChatBotState.loading(),
        const ChatBotState.error(ApiFailure.other('Repo error')),
      ],
    );
  });
}
