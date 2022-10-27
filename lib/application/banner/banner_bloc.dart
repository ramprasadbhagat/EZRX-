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
  BannerBloc({required this.bannerRepository})
      : super(BannerState.initial()) {
    on<BannerEvent>(_onEvent);
  }

  Future<void> _onEvent(BannerEvent event, Emitter<BannerState> emit) async {
    await event.map(
      initialized: (e) async => emit(BannerState.initial()),
      fetch: (e) async {
        final failureOrSuccess = await bannerRepository.getBanner(
          isPreSalesOrg: e.isPreSalesOrg,
          salesOrganisation: e.salesOrganisation,
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
  void onChange(Change<BannerState> change) {
    super.onChange(change);
    // print(change);
  }
}
