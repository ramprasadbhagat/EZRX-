import 'package:bloc/bloc.dart';
import 'package:ezrxmobile/domain/banner/entities/banner.dart';
import 'package:ezrxmobile/domain/banner/repository/banner_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_event.dart';
part 'banner_state.dart';
part 'banner_bloc.freezed.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRepository bannerRepository;
  BannerBloc({required this.bannerRepository}) : super(BannerState.initial()) {
    on<BannerEvent>(_onEvent);
    add(const BannerEvent.fetch());
  }

  Future<void> _onEvent(BannerEvent event, Emitter<BannerState> emit) async {
    await event.map(
      initialized: (e) async => emit(BannerState.initial()),
      fetch: (e) async {
        final result = await bannerRepository.getBanner();
        result.fold(
          (failure) {},
          (banner) => emit(state.copyWith(banner: banner)),
        );
      },
    );
  }

  @override
  Future<void> close() async {
    return super.close();
  }

  @override
  void onChange(Change<BannerState> change) {
    super.onChange(change);
    // print(change);
  }
}
