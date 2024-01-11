part of 'package:ezrxmobile/presentation/account/contact_us/contact_us_page.dart';

class _ContactDetails extends StatelessWidget {
  const _ContactDetails({Key? key}) : super(key: key);

  final contactText = 'Have any questions? we\'d love to hear from you.';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BlocBuilder<ContactUsDetailsBloc, ContactUsDetailsState>(
          buildWhen: (previous, current) =>
              previous.isLoading != current.isLoading,
          builder: (context, state) {
            return state.isLoading
                ? LoadingShimmer.logo(
                    key: WidgetKeys.loaderImage,
                  )
                : Column(
                    children: [
                      Html(
                        key: WidgetKeys.contactDetailsSectionKey,
                        style: {
                          'body': Style(
                            padding: const EdgeInsets.all(0),
                            margin: const EdgeInsets.all(0),
                          ),
                        },
                        data: state.contactUsDetails.content
                            .appendedImgSrcWithBaseUrlWithMedia,
                        shrinkWrap: true,
                      ),
                    ],
                  );
          },
        ),
      ],
    );
  }
}
