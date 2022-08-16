import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ezrxmobile/application/account/sales_org/sales_org_bloc.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/banner/repository/banner_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_event.dart';
part 'banner_state.dart';
part 'banner_bloc.freezed.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository bannerRepository;
  final SalesOrgBloc salesOrgBloc;
  late final StreamSubscription _salesOrgBlocSubscription;
  BannerBloc({required this.bannerRepository,required this.salesOrgBloc}) : super(BannerState.initial()) {
    on<BannerEvent>(_onEvent);
    _salesOrgBlocSubscription = salesOrgBloc.stream.listen((state) {
      print(state.salesOrganisation.salesOrg.value.getOrElse(() => ''));
      add(BannerEvent.fetch(false,state.salesOrganisation.salesOrg.value.getOrElse(() => '')));
    });
  }

  Future<void> _onEvent(BannerEvent event, Emitter<BannerState> emit) async {
    await event.map(
      initialized: (e) async => emit(BannerState.initial()),
      fetch: (e) async {
        final result = await bannerRepository.getBanner(e.isPreSalesOrg, e.salesOrg);
        result.fold(
          (failure) {},
          (banner) => emit(state.copyWith(banner: banner)),
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
