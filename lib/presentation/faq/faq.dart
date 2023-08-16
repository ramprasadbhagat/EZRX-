import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/faq/faq_bloc.dart';
import 'package:ezrxmobile/domain/core/value/value_objects.dart';
import 'package:ezrxmobile/domain/faq/entity/faq_item.dart';
import 'package:ezrxmobile/domain/faq/value/value_object.dart';
import 'package:ezrxmobile/locator.dart';
import 'package:ezrxmobile/presentation/core/search_bar.dart';
import 'package:ezrxmobile/presentation/core/widget_keys.dart';
import 'package:ezrxmobile/presentation/faq/faq_info.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'package:ezrxmobile/presentation/faq/widgets/category_chip.dart';
part 'package:ezrxmobile/presentation/faq/widgets/faq_searchbar.dart';

class FAQPage extends StatelessWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FaqBloc>(
      create: (_) => locator<FaqBloc>()
        ..add(
          FaqEvent.getFaq(
            salesOrg: context.read<SalesOrgBloc>().state.salesOrg,
            user: context.read<UserBloc>().state.user,
          ),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'FAQ'.tr(),
            style: Theme.of(context).textTheme.labelLarge,
          ),
          centerTitle: false,
        ),
        body: BlocBuilder<FaqBloc, FaqState>(
          buildWhen: (previous, current) =>
              previous.isFetching != current.isFetching ||
              previous.getSearchedFaqList != current.getSearchedFaqList ||
              previous.searchKey != current.searchKey,
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    16.0,
                    16.0,
                    0.0,
                    0.0,
                  ),
                  child: Text(
                    'Have a question? We’re here to help'.tr(),
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: ZPColors.primary),
                  ),
                ),
                const _FAQSearchBar(),
                state.showCategoryChip
                    ? const _CategoryChip()
                    : const SizedBox.shrink(),
                state.searchKey.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16.0,
                        ),
                        child: Text(
                          '${'Search result for:'.tr()}${state.searchKey.getOrDefaultValue('')}',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      )
                    : const SizedBox.shrink(),
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.0,
                    ),
                    child: FaqInfoPage(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
