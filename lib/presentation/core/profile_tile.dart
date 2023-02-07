import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/domain/utils/error_utils.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listenWhen: (previous, current) =>
          previous.user != current.user ||
          previous.userFailureOrSuccessOption !=
              current.userFailureOrSuccessOption,
      listener: (context, state) {
        state.userFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              ErrorUtils.handleApiFailure(context, failure);
            },
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        return ListTile(
          key: const Key('profileTile'),
          leading: CircleAvatar(
            backgroundColor: ZPColors.lightGreen,
            child: Text(
              state.user.fullName.shortForm(),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          title: state.isNotEmpty
              ? Text(
                  state.userFullName.toString(),
                  style: Theme.of(context).textTheme.headline6,
                )
              : LoadingShimmer.tile(line: 3),
          subtitle: state.isNotEmpty
              ? Text(
                  state.userRoleName,
                )
              : LoadingShimmer.tile(line: 1),
          onTap: null,
        );
      },
    );
  }
}
