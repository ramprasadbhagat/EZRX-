import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_indicator/loading_indicator.dart';

class AnnouncementWidget extends StatelessWidget {
  const AnnouncementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementBloc, AnnouncementState>(
      builder: (_, state) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (_, authState) {
            final displayTime = state.announcement.loginType;
            final isValidTime = authState.map<bool>(
              authenticated: (value) =>
                  displayTime.isPostLogin || displayTime.isPreAndPost,
              initial: (value) => false,
              loading: (value) => false,
              unauthenticated: (value) =>
                  displayTime.isPreLogin || displayTime.isPreAndPost,
            );
            if (!state.announcement.hasValidAnnouncement ||
                state.isClosed ||
                !isValidTime) {
              return const SizedBox();
            }

            return Dismissible(
              key: const Key('dismissibleAnnouncement'),
              direction: state.announcement.isCrossButton
                  ? DismissDirection.horizontal
                  : DismissDirection.none,
              onDismissed: (direction) {
                context
                    .read<AnnouncementBloc>()
                    .add(const AnnouncementEvent.close());
              },
              child: SafeArea(
                bottom: false,
                child: Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  color: ZPColors.announcementColor,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                        child: state.isLoading
                            ? Container(
                                key: const Key(
                                  'announcementLoadingIndicator',
                                ),
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
                                        const AnnouncementEvent
                                            .getAnnouncement(),
                                      );
                                },
                                padding: const EdgeInsets.only(right: 8.0),
                                icon: const Icon(
                                  Icons.replay_outlined,
                                  color: ZPColors.white,
                                ),
                              ),
                      ),
                      BlocConsumer<SalesOrgBloc, SalesOrgState>(
                        listenWhen: (previous, current) =>
                            previous.salesOrg != current.salesOrg,
                        listener: (context, salesOrgState) {
                          context.read<AnnouncementBloc>().add(
                                const AnnouncementEvent.changePreferLanguage(
                                  preferSalesOrgLanguage: true,
                                ),
                              );
                        },
                        buildWhen: (previous, current) =>
                            previous.salesOrg != current.salesOrg,
                        builder: (context, salesOrgState) {
                          final announcement =
                              state.announcement.descriptionDisplay(
                            languageCode: state.preferSalesOrgLanguage
                                ? salesOrgState.salesOrg.languageCode
                                : context.locale.languageCode,
                          );

                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                announcement,
                                key: const Key(
                                  'announcementDescription',
                                ),
                                textAlign: TextAlign.justify,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.apply(
                                      color: ZPColors.white,
                                    ),
                              ),
                            ),
                          );
                        },
                      ),
                      if (state.announcement.isCrossButton)
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
              ),
            );
          },
        );
      },
    );
  }
}
