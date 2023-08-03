import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_bloc.dart';
import 'package:ezrxmobile/application/announcement_info/announcement_info_details/announcement_info_details_bloc.dart';
import 'package:ezrxmobile/domain/announcement_info/entities/announcement_info_details.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/responsive.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';

const offSet = 60.0;

class AnnouncementInfoDetailsPage extends StatefulWidget {
  const AnnouncementInfoDetailsPage({Key? key}) : super(key: key);

  @override
  State<AnnouncementInfoDetailsPage> createState() =>
      _AnnouncementInfoDetailsPageState();
}

class _AnnouncementInfoDetailsPageState
    extends State<AnnouncementInfoDetailsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollAtInitialPosition = true;
  bool _isBackButtonEnableForAppbar = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollListener() {
    setState(() {
      _isScrollAtInitialPosition = _scrollController.initialScrollOffset ==
          _scrollController.position.pixels;
      _isBackButtonEnableForAppbar = _scrollController.position.pixels > 220;
    });
  }

  void _changeStateOnMovingToNewDetails() {
    setState(() {
      _isScrollAtInitialPosition = true;
      _isBackButtonEnableForAppbar = false;
    });
  }

  void _scrollToTop() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        0.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AnnouncementInfoDetailsBloc,
        AnnouncementInfoDetailsState>(
      listenWhen: (previous, current) =>
          previous.apiFailureOrSuccessOption !=
          current.apiFailureOrSuccessOption,
      listener: (context, state) {
        state.apiFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return Scaffold(
          key: WidgetKeys.announcementDetailsPageKey,
          body: SafeArea(
            child: state.isLoading
                ? LoadingShimmer.logo(
                    key: WidgetKeys.loaderImage,
                  )
                : CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        expandedHeight: 300,
                        floating: true,
                        snap: true,
                        pinned: true,
                        flexibleSpace: Stack(
                          children: [
                            FlexibleSpaceBar(
                              background: CachedNetworkImage(
                                width: MediaQuery.of(context).size.width,
                                imageUrl:
                                    state.announcementInfoDetails.thumbnail,
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    LoadingShimmer.withChild(
                                  child: Container(
                                    color: ZPColors.whiteBgCard,
                                    width: MediaQuery.of(context).size.width,
                                    height: 200,
                                  ),
                                ),
                                errorWidget: (context, url, error) {
                                  return const NoRecordFound(
                                    svgImage: SvgImage.noImageAvailable,
                                    title: 'Image not available',
                                    subTitle: '',
                                  );
                                },
                              ),
                            ),
                            _isBackButtonEnableForAppbar
                                ? const SizedBox.shrink()
                                : IconButton(
                                    onPressed: () => context.router.pop(),
                                    icon: const CircleAvatar(
                                      maxRadius: 13,
                                      backgroundColor: ZPColors
                                          .defaultReturnSummaryStatusColor,
                                      child: Icon(
                                        Icons.arrow_back_ios_new_rounded,
                                        size: 15,
                                        color: ZPColors.white,
                                      ),
                                    ),
                                  ),
                          ],
                        ),
                        centerTitle: false,
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(offSet),
                          child: AppBar(
                            automaticallyImplyLeading: false,
                            leading: _isBackButtonEnableForAppbar
                                ? IconButton(
                                    onPressed: () => context.router.pop(),
                                    icon: const Icon(
                                      Icons.arrow_back_ios_rounded,
                                      size: 20,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            centerTitle: false,
                            leadingWidth: _isBackButtonEnableForAppbar ? 20 : 0,
                            title: _TitleSection(
                              details: state.announcementInfoDetails,
                            ),
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 10,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Html(
                                    style: {
                                      'body': Style(
                                        padding: const EdgeInsets.all(0),
                                        margin: const EdgeInsets.all(0),
                                      ),
                                    },
                                    data: state.announcementInfoDetails.content
                                        .appendedImgSrcWithBaseUrl,
                                    shrinkWrap: true,
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            ),
                            _BottomSheet(
                              isLoading: state.isLoading,
                              changeState: _changeStateOnMovingToNewDetails,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          floatingActionButton: !_isScrollAtInitialPosition
              ? FloatingActionButton(
                  key: WidgetKeys.materialDetailsFloatingButton,
                  onPressed: () => _scrollToTop(),
                  mini: true,
                  backgroundColor: ZPColors.secondaryMustard,
                  child: const Icon(
                    Icons.expand_less,
                    color: ZPColors.black,
                  ),
                )
              : const SizedBox.shrink(),
        );
      },
    );
  }
}

class _TitleSection extends StatelessWidget {
  const _TitleSection({
    Key? key,
    required this.details,
  }) : super(key: key);

  final AnnouncementInfoDetails details;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    FittedBox(
                      child: Text(
                        details.publishedDate.getAnnouncementDateFormatWithTime,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ZPColors.neutralsGrey1,
                              fontSize: 10,
                            ),
                      ),
                    ),
                    FittedBox(
                      child: Text(
                        details.title,
                        style: Theme.of(context).textTheme.labelSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
                    details.sourceAndOrAuthorLabel.isNotEmpty
                        ? FittedBox(
                            child: Text(
                              details.sourceAndOrAuthorLabel,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: ZPColors.neutralsGrey1,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                decoration: const BoxDecoration(
                  color: ZPColors.skyBlueColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Text(
                  'New'.tr(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: ZPColors.whiteBgCard,
                        fontSize: 10,
                      ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

class _ItemDescription extends StatelessWidget {
  final String title;
  final String description;
  final DateTimeStringValue publishedDate;
  const _ItemDescription({
    Key? key,
    required this.title,
    required this.publishedDate,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            publishedDate.getAnnouncementDateFormat,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ZPColors.extraLightGrey4, fontSize: 10),
          ),
          Text(
            title,
            maxLines: Responsive.isMobile(context) ? 2 : 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
          Text(
            description,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: ZPColors.extraLightGrey4,
                ),
          ),
        ],
      ),
    );
  }
}

class _BottomSheet extends StatelessWidget {
  const _BottomSheet({
    Key? key,
    required this.isLoading,
    required this.changeState,
  }) : super(key: key);

  final bool isLoading;
  final Function changeState;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AnnouncementInfoBloc, AnnouncementInfoState>(
      buildWhen: (previous, current) => previous.isLoading != current.isLoading,
      builder: (context, state) {
        return Container(
          height: 175,
          color: ZPColors.whiteBgCard,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Other Announcements'.tr(),
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: ZPColors.neutralsBlack,
                      ),
                ),
              ),
              SizedBox(
                height: 140,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  itemCount: state.announcementInfo.announcementList.length,
                  itemBuilder: (context, index) {
                    final currentAnnouncement =
                        state.announcementInfo.announcementList[index];

                    return currentAnnouncement.id ==
                            context
                                .read<AnnouncementInfoDetailsBloc>()
                                .state
                                .announcementInfoDetails
                                .id
                        ? const SizedBox.shrink()
                        : LoadingShimmer.withChild(
                            enabled: isLoading,
                            child: GestureDetector(
                              onTap: () {
                                changeState();
                                context.read<AnnouncementInfoDetailsBloc>().add(
                                      AnnouncementInfoDetailsEvent.fetch(
                                        itemId: currentAnnouncement.id,
                                        salesOrg: context
                                            .read<SalesOrgBloc>()
                                            .state
                                            .salesOrg,
                                      ),
                                    );
                              },
                              child: CustomCard(
                                showBorder: true,
                                width: MediaQuery.of(context).size.width * 0.5,
                                margin: const EdgeInsets.all(8),
                                clipBehavior: Clip.antiAlias,
                                child: _ItemDescription(
                                  title: currentAnnouncement.title,
                                  description: currentAnnouncement.summary,
                                  publishedDate:
                                      currentAnnouncement.publishedDate,
                                ),
                              ),
                            ),
                          );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        );
      },
    );
  }
}
