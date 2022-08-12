import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'banner_event.dart';
part 'banner_state.dart';
part 'banner_bloc.freezed.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  BannerBloc() : super(_Initial()) {
    on<BannerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
