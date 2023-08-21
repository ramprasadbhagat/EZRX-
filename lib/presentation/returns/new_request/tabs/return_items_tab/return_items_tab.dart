import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/customer_code/customer_code_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/new_request_bloc.dart';
import 'package:ezrxmobile/application/returns/new_request/return_items/return_items_bloc.dart';
import 'package:ezrxmobile/domain/returns/entities/return_material.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/custom_badge.dart';
import 'package:ezrxmobile/presentation/core/edge_checkbox.dart';
import 'package:ezrxmobile/presentation/core/no_record.dart';
import 'package:ezrxmobile/presentation/core/scroll_list.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/core/snack_bar/custom_snackbar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/expandable_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_card.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_details_section.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_info_widget.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/material_quantity_and_price.dart';
import 'package:ezrxmobile/presentation/returns/new_request/widgets/product_image_with_label.dart';

part 'widgets/return_material_widget.dart';
part 'widgets/expandable_section.dart';
part 'widgets/return_material_info.dart';
part 'widgets/bonus_item_section.dart';

class ReturnItemsTab extends StatelessWidget {
  const ReturnItemsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Row(
            children: [
              Expanded(
                child: SearchBar(
                  onSearchChanged: (String value) {},
                  clearIconKey: WidgetKeys.clearIconKey,
                  controller: TextEditingController(),
                  onClear: () {},
                ),
              ),
              CustomBadge(
                Icons.tune,
                count: 0,
                badgeColor: ZPColors.orange,
                onPressed: () {},
              ),
            ],
          ),
        ),
        BlocConsumer<ReturnItemsBloc, ReturnItemsState>(
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
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          builder: (context, state) {
            return Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: ScrollList<ReturnMaterial>(
                  noRecordFoundWidget: const NoRecordFound(
                    title: 'No record found',
                  ),
                  controller: ScrollController(),
                  onRefresh: () {
                    context.read<ReturnItemsBloc>().add(
                          ReturnItemsEvent.fetch(
                            salesOrganisation: context
                                .read<SalesOrgBloc>()
                                .state
                                .salesOrganisation,
                            customerCodeInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .customerCodeInfo,
                            shipToInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .shipToInfo,
                          ),
                        );
                  },
                  onLoadingMore: () {
                    context.read<ReturnItemsBloc>().add(
                          ReturnItemsEvent.loadMore(
                            salesOrganisation: context
                                .read<SalesOrgBloc>()
                                .state
                                .salesOrganisation,
                            customerCodeInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .customerCodeInfo,
                            shipToInfo: context
                                .read<CustomerCodeBloc>()
                                .state
                                .shipToInfo,
                          ),
                        );
                  },
                  isLoading: state.isLoading,
                  itemBuilder: (context, index, item) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: _ReturnMaterialWidget(
                      data: item,
                    ),
                  ),
                  items: state.items,
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
