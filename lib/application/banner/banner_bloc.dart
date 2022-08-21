import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/banner/error/banner_failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/banner/repository/i_banner_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_event.dart';
part 'banner_state.dart';
part 'banner_bloc.freezed.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final IBannerRepository bannerRepository;
  final SalesOrgBloc salesOrgBloc;
  late final StreamSubscription _salesOrgBlocSubscription;
  BannerBloc({required this.bannerRepository, required this.salesOrgBloc})
      : super(BannerState.initial()) {
    on<BannerEvent>(_onEvent);
    _salesOrgBlocSubscription = salesOrgBloc.stream.listen((state) {
      if (state.salesOrganisation != SalesOrganisation.empty()) {
        add(BannerEvent.fetch(false, state.salesOrganisation));
      }
    });
  }

  Future<void> _onEvent(BannerEvent event, Emitter<BannerState> emit) async {
    await event.map(
      initialized: (e) async => emit(BannerState.initial()),
      fetch: (e) async {
        final failureOrSuccess = await bannerRepository.getBanner(
          e.isPreSalesOrg,
          e.salesOrganisation,
        );

        failureOrSuccess.fold(
          (failure) {
            emit(state.copyWith(
              banner: [BannerItem.empty()],
              bannerFailureOrSuccessOption: optionOf(failureOrSuccess),
            ));
          },
          (banner) => emit(state.copyWith(
            banner: banner,
            bannerFailureOrSuccessOption: none(),
          )),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    await _salesOrgBlocSubscription.cancel();
    return super.close();
  }

  @override
  void onChange(Change<BannerState> change) {
    super.onChange(change);
    // print(change);
  }
}
