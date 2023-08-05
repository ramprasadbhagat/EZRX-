import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:ezrxmobile/domain/account/entities/sales_organisation.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/banner/repository/i_banner_repository.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_bloc.freezed.dart';
part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final IBannerRepository bannerRepository;
  BannerBloc({required this.bannerRepository}) : super(BannerState.initial()) {
    on<BannerEvent>(_onEvent);
  }

  Future<void> _onEvent(BannerEvent event, Emitter<BannerState> emit) async {
    await event.map(
      initialized: (e) async => emit(BannerState.initial()),
      fetch: (e) async {
        //Fetch eZReach Banner
        final eZReachFailureOrSuccess = await bannerRepository.getEZReachBanner(
          salesOrganisation: e.salesOrganisation,
          country: e.country,
          role: e.role,
          bannerType: e.bannerType,
        );

        //Fetch eZRx Banner
        final eZRxFailureOrSuccess = await bannerRepository.getBanner(
          isPreSalesOrg: e.isPreSalesOrg,
          salesOrganisation: e.salesOrganisation,
        );

        eZReachFailureOrSuccess.fold(
          //eZReach Banner failed
          (failure) {
            eZRxFailureOrSuccess.fold(
              (failure) => emit(
                state.copyWith(
                  banner: [BannerItem.empty()], //Both banners failed
                  bannerFailureOrSuccessOption: optionOf(eZRxFailureOrSuccess),
                ),
              ),
              (eZRxBannerList) => emit(
                state.copyWith(
                  banner: eZRxBannerList, // Only eZRx banner success
                  bannerFailureOrSuccessOption: none(),
                ),
              ),
            );
          },

          //eZReach Banner success
          (eZReachBannerList) {
            eZRxFailureOrSuccess.fold(
              (failure) => emit(
                state.copyWith(
                  banner: eZReachBannerList, // Only eZReach banner success
                  bannerFailureOrSuccessOption: none(),
                ),
              ),
              (eZRxBannerList) => emit(
                state.copyWith(
                  banner:
                      eZReachBannerList + eZRxBannerList, // Both banner success
                  bannerFailureOrSuccessOption: none(),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  void onChange(Change<BannerState> change) {
    super.onChange(change);
    // print(change);
  }
}
