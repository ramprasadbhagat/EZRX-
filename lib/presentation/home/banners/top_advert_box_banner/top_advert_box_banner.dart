import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/banner/banner_bloc.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/home/banners/top_advert_box_banner/top_advert_box_banner_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopAdvertBoxBanner extends StatelessWidget {
  const TopAdvertBoxBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => locator<BannerBloc>(),
      child: BlocListener<CustomerCodeBloc, CustomerCodeState>(
        listenWhen: (previous, current) =>
            previous.customerCodeInfo != current.customerCodeInfo,
        listener: (context, state) {
          context.read<BannerBloc>().add(
                BannerEvent.fetch(
                  isPreSalesOrg: false,
                  salesOrganisation:
                      context.read<EligibilityBloc>().state.salesOrganisation,
                  country:
                      context.read<EligibilityBloc>().state.salesOrg.country,
                  role: context
                      .read<EligibilityBloc>()
                      .state
                      .user
                      .role
                      .type
                      .getEZReachRoleType,
                  bannerType: 'top_advert_box',
                ),
              );
        },
        child: BlocBuilder<BannerBloc, BannerState>(
          buildWhen: (previous, current) {
            return previous.banner != current.banner;
          },
          builder: (context, state) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: state.banner.length,
              itemBuilder: (context, index) {
                return TopAdvertBoxBannerTile(
                  imageUrl: state.banner[index].url,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
