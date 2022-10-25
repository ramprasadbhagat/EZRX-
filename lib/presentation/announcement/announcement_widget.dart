import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AnnouncementWidget extends StatelessWidget {
  const AnnouncementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<AnnouncementBloc, AnnouncementState>(
        buildWhen: (previous, current) => previous != current,
        builder: (_, state) {
          if (!state.hasValidAnnouncement) {
            return const SizedBox();
          }

          return Dismissible(
            key: const Key('dismissibleAnnouncement'),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 24.0),
              color: ZPColors.announcementColor,
              child: Row(
                children: [
                  SizedBox(
                    width: 40,
                    child: state.isLoading
                        ? Container(
                            key: const Key('announcementLoadingIndicator'),
                            width: 30,
                            height: 10,
                            padding: const EdgeInsets.only(right: 8.0),
                            child: const LoadingIndicator(
                              indicatorType: Indicator.ballBeat,
                              colors: [ZPColors.white],
                            ),
                          )
                        : IconButton(
                            key: const Key('announcementReloadIcon'),
                            onPressed: () {
                              context.read<AnnouncementBloc>().add(
                                    const AnnouncementEvent.getAnnouncement(),
                                  );
                            },
                            padding: const EdgeInsets.only(right: 8.0),
                            icon: const Icon(
                              Icons.replay_outlined,
                              color: ZPColors.white,
                            ),
                          ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        state.descriptionDisplay,
                        key: const Key('announcementDescription'),
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: ZPColors.white,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    key: const Key('announcementCloseIcon'),
                    onPressed: () {
                      context
                          .read<AnnouncementBloc>()
                          .add(const AnnouncementEvent.close());
                    },
                    padding: const EdgeInsets.only(left: 8.0),
                    icon: const Icon(
                      Icons.close,
                      color: ZPColors.white,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
