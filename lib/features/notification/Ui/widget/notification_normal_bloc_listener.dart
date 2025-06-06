import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn_programtion/features/notification/Ui/widget/notifacation_normal.dart';
import 'package:learn_programtion/features/notification/Ui/widget/notification_normal_shimmer.dart';
import 'package:learn_programtion/features/profile/logic/profile_cubit/cubit/profile_and_notification_cubit.dart';
import 'package:learn_programtion/features/profile/logic/profile_cubit/cubit/profile_and_notification_state.dart';

import '../../logic/model/notification_response.dart';

class NotificationNormalBlocListener extends StatelessWidget {
  const NotificationNormalBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileAndNotificationCubit,
            ProfileAndNotificationState>(
        child: const SizedBox.shrink(),
        listenWhen: (previous, current) =>
            current is LoadingNotificationNormal ||
            current is SuccessNotificationNormal ||
            current is ErrorNotificationNormal,
        listener: (context, state) {
          state.maybeWhen(
            loadingNotificationNormal: () {
              loadingNotification();
            },
            successNotificationNormal: (data) {
              successNotification(data);
            },
            errorNotificationNormal: (error) {
              errorNotification();
            },
            orElse: () {},
          );
        });
  }
}

Widget successNotification(List<NotificationItem> notification) {
  return NotificationNormal(notification);
}

Widget errorNotification() {
  return Center(
    child: SvgPicture.asset('assets/svg/404error.svg'),
  );
}

Widget loadingNotification() {
  return NotificationNormallShinmmer();
}
