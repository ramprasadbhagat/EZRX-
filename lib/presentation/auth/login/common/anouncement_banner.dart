import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/announcement/announcement_bloc.dart';
import 'package:ezrxmobile/application/deep_linking/deep_linking_bloc.dart';
import 'package:ezrxmobile/domain/announcement/entities/maintenance_item.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

class AnnouncementBannerWidget extends StatelessWidget {
  const AnnouncementBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementBloc, AnnouncementState>(
      buildWhen: (previous, current) =>
          previous.maintenanceItem.preLoginList !=
              current.maintenanceItem.preLoginList ||
          previous.listBannersIdClosed != current.listBannersIdClosed ||
          previous.isLoading != current.isLoading,
      builder: (context, state) {
        final list = state.maintenanceItem.preLoginList.where(
          (element) => !state.listBannersIdClosed.contains(element.id),
        );

        if (list.isEmpty) {
          return const SizedBox();
        }

        return Column(
          children: list
              .map(
                (e) => _ItemAnnouncement(banner: e, isLoading: state.isLoading),
              )
              .toList(),
        );
      },
    );
  }
}

class _ItemAnnouncement extends StatelessWidget {
  final MaintenanceBanner banner;
  final bool isLoading;

  const _ItemAnnouncement({
    Key? key,
    required this.banner,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: LoadingShimmer.withChild(
        enabled: isLoading,
        child: ListTile(
          tileColor: ZPColors.errorSnackBarColor,
          dense: true,
          contentPadding: const EdgeInsets.all(8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          title: Html(
            data: banner.contentHtml(context.tr('More')),
            style: {
              'body': Style(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
              ),
            },
            onLinkTap: (url, _, attributes, element) {
              if (banner.hyperlink.isInternalLink) {
                context.read<DeepLinkingBloc>().add(
                      DeepLinkingEvent.addPendingLink(banner.hyperlink.uri),
                    );
              } else if (banner.hyperlink.isExternalLink) {
                context.router.push(
                  WebViewPageRoute(
                    url: banner.hyperlink.getOrDefaultValue(''),
                  ),
                );
              }
            },
          ),
          trailing: banner.enableCrossButton
              ? InkWell(
                  onTap: () {
                    context
                        .read<AnnouncementBloc>()
                        .add(AnnouncementEvent.closedBannerId(id: banner.id));
                  },
                  child: const Icon(
                    Icons.close,
                    color: ZPColors.backgroundCloseButtonSnackBar,
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
