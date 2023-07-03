//ignore_for_file: unused-code
//ignore_for_file: unused-class
//ignore_for_file: unused-files
import 'package:ezrxmobile/application/auth/login/login_form_bloc.dart';
import 'package:ezrxmobile/application/chatbot/chat_bot_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/chatbot/draggable_floating_action_button.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatBotWidget extends StatelessWidget {
  final Widget child;

  ChatBotWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final GlobalKey _parentKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final dx = MediaQuery.of(context).size.width * (isMobile ? 0.85 : 0.93);
    final dy = MediaQuery.of(context).size.height * (isMobile ? 0.75 : 0.85);

    return Stack(
      key: _parentKey,
      children: [
        child,
        BlocBuilder<LoginFormBloc, LoginFormState>(
          buildWhen: (previous, current) =>
              previous.isSubmitting != current.isSubmitting,
          builder: (context, state) {
            return BlocListener<ChatBotBloc, ChatBotState>(
              listener: (context, state) {
                state.whenOrNull(error: (e) {
                  ErrorUtils.handleApiFailure(context, e);
                });
              },
              child: DraggableFloatingActionButton(
                parentKey: _parentKey,
                initialOffset: Offset(dx, dy),
                onPressed: () => context
                    .read<ChatBotBloc>()
                    .add(const ChatBotEvent.startChatbot()),
                child: const _Logo(),
              ),
            );
          },
        ),
      ],
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: ZPColors.primary,
      child: SvgPicture.asset(
        SvgImage.ezrxPlusLogo,
      ),
    );
  }
}
