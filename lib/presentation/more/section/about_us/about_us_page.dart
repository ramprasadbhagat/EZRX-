import 'package:flutter/material.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/custom_image.dart';
import 'package:ezrxmobile/domain/about_us/entities/about_us.dart';
import 'package:ezrxmobile/application/about_us/about_us_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
part 'package:ezrxmobile/presentation/more/section/about_us/widgets/why_us_section.dart';
part 'package:ezrxmobile/presentation/more/section/about_us/widgets/reach_us_section.dart';
part 'package:ezrxmobile/presentation/more/section/about_us/widgets/who_we_are_section.dart';
part 'package:ezrxmobile/presentation/more/section/about_us/widgets/our_partners_section.dart';
part 'package:ezrxmobile/presentation/more/section/about_us/widgets/certifications_section.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrollAtInitialPosition = true;
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
    return BlocProvider(
      create: (context) => locator<AboutUsBloc>()
        ..add(
          AboutUsEvent.fetchAboutUsInfo(
            salesOrg: context
                .read<EligibilityBloc>()
                .state
                .salesOrganisation
                .salesOrg,
          ),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'About Us'.tr(),
          ),
          centerTitle: false,
        ),
        body: BlocConsumer<AboutUsBloc, AboutUsState>(
          listenWhen: (previous, current) =>
              previous.apiFailureOrSuccessOption !=
              current.apiFailureOrSuccessOption,
          listener: (context, state) => state.apiFailureOrSuccessOption.fold(
            () {},
            (either) => either.fold(
              (failure) => ErrorUtils.handleApiFailure(context, failure),
              (_) {},
            ),
          ),
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          builder: (context, state) {
            if (state.isFetching) {
              return LoadingShimmer.logo(
                key: WidgetKeys.loaderImage,
              );
            }
            final aboutUsInfo = state.aboutUsInfo;

            return RefreshIndicator(
              onRefresh: () async => context.read<AboutUsBloc>().add(
                    AboutUsEvent.fetchAboutUsInfo(
                      salesOrg: context
                          .read<EligibilityBloc>()
                          .state
                          .salesOrganisation
                          .salesOrg,
                    ),
                  ),
              child: aboutUsInfo != AboutUs.empty()
                  ? ListView(
                      controller: _scrollController,
                      children: [
                        CustomImage(
                          imageUrl: aboutUsInfo.banner.media.src,
                          errorWidget: const SizedBox.shrink(),
                          width: double.infinity,
                          height: 200,
                        ),
                        _HeaderSection(
                          description: aboutUsInfo.banner.content,
                        ),
                        _OurCertificationsSection(
                          certifications: aboutUsInfo.certifications,
                        ),
                        _WhoWeAreSection(
                          whoWeAre: state.aboutUsInfo.whoWeAre,
                        ),
                        _WhyUsSection(
                          whyUs: aboutUsInfo.whyUs,
                        ),
                        _OurPartnersSection(
                          ourPartners: aboutUsInfo.ourPartners,
                        ),
                        _ReachUsSection(
                          reachUs: aboutUsInfo.reachUs,
                        ),
                      ],
                    )
                  : ListView(
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.height),
                      ],
                    ),
            );
          },
        ),
        floatingActionButton: !_isScrollAtInitialPosition
            ? FloatingActionButton(
                key: WidgetKeys.aboutUsFloatingButton,
                onPressed: () => _scrollToTop(),
                mini: true,
                backgroundColor: ZPColors.secondaryMustard,
                child: const Icon(
                  Icons.expand_less,
                  color: ZPColors.black,
                ),
              )
            : null,
      ),
    );
  }
}

class _HeaderSection extends StatelessWidget {
  final String description;
  const _HeaderSection({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About us'.tr(),
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: ZPColors.extraDarkGreen,
                ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: ZPColors.neutralsBlack,
                ),
          ),
          const SizedBox(height: 10),
          Center(
            child: ElevatedButton(
              onPressed: () => context.router.pushNamed('contact_us'),
              child: Text('Get in touch'.tr()),
            ),
          ),
        ],
      ),
    );
  }
}
