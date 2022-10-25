import 'package:easy_localization/easy_localization.dart';
import 'package:ezrxmobile/application/account/user/user_bloc.dart';
import 'package:ezrxmobile/application/auth/auth_bloc.dart';
import 'package:ezrxmobile/domain/core/error/api_failures.dart';
import 'package:ezrxmobile/presentation/core/loading_shimmer.dart';
import 'package:ezrxmobile/presentation/core/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listenWhen: (previous, current) => previous.user != current.user,
      listener: (context, state) {
        state.userFailureOrSuccessOption.fold(
          () {},
          (either) => either.fold(
            (failure) {
              final failureMessage = failure.failureMessage;
              showSnackBar(context: context, message: failureMessage.tr());
              if (failureMessage == 'authentication failed') {
                context.read<AuthBloc>().add(const AuthEvent.logout());
              }
            },
            (_) {},
          ),
        );
      },
      buildWhen: (previous, current) => previous.user != current.user,
      builder: (context, state) {
        return ListTile(
          key: const Key('profileTile'),
          leading: CircleAvatar(child: Text(state.user.fullName.shortForm())),
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
