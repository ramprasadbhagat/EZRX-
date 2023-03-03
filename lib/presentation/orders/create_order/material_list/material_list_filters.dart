import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/order/material_filter/material_filter_bloc.dart';
import 'package:ezrxmobile/presentation/core/custom_selector.dart';
import 'package:ezrxmobile/presentation/routes/router.gr.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaterialListFilters extends StatelessWidget {
  const MaterialListFilters({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MaterialFilterBloc, MaterialFilterState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          color: ZPColors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomSelector(
                title: 'Principal'.tr(),
                child: Text(
                  state.getFilterLabel(MaterialFilterType.principal).tr(),
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall?.apply(
                        color: ZPColors.primary,
                      ),
                ),
                onTap: () {
                  context.router.push(
                    MaterialFilterPageRoute(
                      filterType: MaterialFilterType.principal,
                    ),
                  );
                },
              ),
              CustomSelector(
                title: 'Therapeutic'.tr(),
                child: Text(
                  state.getFilterLabel(MaterialFilterType.therapeutic).tr(),
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall?.apply(
                        color: ZPColors.primary,
                      ),
                ),
                onTap: () {
                  context.router.push(
                    MaterialFilterPageRoute(
                      filterType: MaterialFilterType.therapeutic,
                    ),
                  );
                },
              ),
              CustomSelector(
                title: 'Brand'.tr(),
                child: Text(
                  state.getFilterLabel(MaterialFilterType.brand).tr(),
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleSmall?.apply(
                        color: ZPColors.primary,
                      ),
                ),
                onTap: () {
                  context.router.push(
                    MaterialFilterPageRoute(
                      filterType: MaterialFilterType.brand,
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
