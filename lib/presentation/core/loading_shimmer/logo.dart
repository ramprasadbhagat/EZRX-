part of 'loading_shimmer.dart';

class _Logo extends StatelessWidget {
  const _Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _WithChild(
      enabled: true,
      child: Image.asset(
        'assets/images/ezrxlogo.png',
        width: 80,
        height: 80,
      ),
    );
  }
}
