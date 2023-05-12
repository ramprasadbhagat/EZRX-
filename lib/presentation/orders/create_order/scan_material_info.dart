import 'package:auto_route/auto_route.dart';
import 'package:ezrxmobile/presentation/announcement/announcement_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ezrxmobile/application/order/scan_material_info/scan_material_info_bloc.dart';

class ScanMaterialInfo extends StatefulWidget {
  const ScanMaterialInfo({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ScanMaterialInfoState();
  }
}

class _ScanMaterialInfoState extends State<ScanMaterialInfo>
    with WidgetsBindingObserver {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late ScanMaterialInfoBloc scanMaterialInfoBloc;
  _ScanMaterialInfoState();

  @override
  void initState() {
    super.initState();

    _ambiguate(WidgetsBinding.instance)?.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      scanMaterialInfoBloc
          .add(const ScanMaterialInfoEvent.scanMaterialNumberFromCamera());
    } else if (state == AppLifecycleState.paused) {
      scanMaterialInfoBloc.add(const ScanMaterialInfoEvent.disableScan());
    }
  }

  @override
  void dispose() {
    scanMaterialInfoBloc.add(const ScanMaterialInfoEvent.disableScan());
    _ambiguate(WidgetsBinding.instance)?.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    scanMaterialInfoBloc = context.read<ScanMaterialInfoBloc>();

    return BlocConsumer<ScanMaterialInfoBloc, ScanMaterialInfoState>(
      listenWhen: (previous, current) =>
          previous.scannedData != current.scannedData,
      listener: (context, state) {
        context.router.pop();
      },
      builder: (context, state) {
        return Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: const Text('Scan Material'),
          ),
          body: SafeArea(
            child: AnnouncementBanner(
              currentPath: context.router.currentPath,
              child: scanMaterialInfoBloc.dataCaptureView,
            ),
          ),
        );
      },
    );
  }

  T? _ambiguate<T>(T value) => value;
}
