part of '../profile_page.dart';

class _LicenseTile extends StatelessWidget {
  const _LicenseTile({
    Key? key,
    required this.customerLicense,
  }) : super(key: key);

  final CustomerLicense customerLicense;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  text: customerLicense.licenseType.displayNAIfEmpty,
                  style: Theme.of(context).textTheme.labelSmall,
                  children: <TextSpan>[
                    const TextSpan(text: ' - '),
                    TextSpan(
                      text: customerLicense.licenseDescription.displayNAIfEmpty,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              RichText(
                text: TextSpan(
                  text: 'License no:'.tr(),
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: ZPColors.darkGray),
                  children: <TextSpan>[
                    const TextSpan(text: ' - '),
                    TextSpan(
                      text:
                          customerLicense.licenseDescription.displayNAIfEmpty,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              RichText(
                text: TextSpan(
                  text: 'From '.tr(),
                  style: Theme.of(context).textTheme.labelSmall,
                  children: <TextSpan>[
                    TextSpan(
                      text: customerLicense.validFrom.dateTimeOrNaString,
                    ),
                    TextSpan(
                      text: ' to '.tr(),
                    ),
                    TextSpan(
                      text: customerLicense.validTo.dateTimeOrNaString,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              customerLicense.validTo.aWeekDifference
                  ? Row(
                      children: [
                        const Icon(
                          Icons.info,
                          color: ZPColors.skyBlueColor,
                          size: 18,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Expiring in 7 days'.tr(),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: ZPColors.skyBlueColor,
                                  ),
                        ),
                      ],
                    )
                  : const SizedBox.shrink(),
            ],
          ),
          StatusLabel(status: customerLicense.licenseStatus),
        ],
      ),
    );
  }
}
