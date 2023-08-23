import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_license_bloc/customer_license_bloc.dart';
import 'package:ezrxmobile/application/account/eligibility/eligibility_bloc.dart';
import 'package:ezrxmobile/application/account/language/language_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/customer_license.dart';
import 'package:ezrxmobile/domain/auth/entities/language.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/balance_text_row.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/core/language_picker.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/status_label.dart';
import 'package:ezrxmobile/presentation/core/svg_image.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'widgets/footer.dart';
part 'widgets/header.dart';
part 'widgets/language_dropdown.dart';
part 'widgets/user_details.dart';
part 'widgets/license_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'.tr()),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16, top: 16),
        child: BlocConsumer<CustomerLicenseBloc, CustomerLicenseState>(
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching,
          listenWhen: (previous, current) =>
              previous.failureOrSuccessOption != current.failureOrSuccessOption,
          listener: (context, state) {
            state.failureOrSuccessOption.fold(
              () {},
              (either) => either.fold(
                (failure) {
                  ErrorUtils.handleApiFailure(context, failure);
                },
                (_) {},
              ),
            );
          },
          builder: (context, state) {
            return ScrollList<CustomerLicense>(
              header: const _Header(),
              noRecordFoundWidget: const NoRecordFound(
                title: 'Looks like you don`t have any license here',
                subTitle: '',
                svgImage: SvgImage.emptyOrder,
              ),
              controller: ScrollController(),
              onRefresh: () => context.read<CustomerLicenseBloc>().add(
                    CustomerLicenseEvent.fetch(
                      customerInfo: context
                          .read<EligibilityBloc>()
                          .state
                          .customerCodeInfo,
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      user: context.read<EligibilityBloc>().state.user,
                    ),
                  ),
              onLoadingMore: () => context.read<CustomerLicenseBloc>().add(
                    CustomerLicenseEvent.loadMore(
                      customerInfo: context
                          .read<EligibilityBloc>()
                          .state
                          .customerCodeInfo,
                      salesOrganisation:
                          context.read<SalesOrgBloc>().state.salesOrganisation,
                      user: context.read<EligibilityBloc>().state.user,
                    ),
                  ),
              isLoading: state.isFetching,
              itemBuilder: (context, index, item) =>
                  _LicenseTile(customerLicense: item),
              items: state.customerLicenses,
            );
          },
        ),
      ),
      bottomNavigationBar: const _Footer(),
    );
  }
}
