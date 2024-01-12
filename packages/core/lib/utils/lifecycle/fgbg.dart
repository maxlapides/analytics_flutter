import 'dart:async';

import 'package:analytics/utils/lifecycle/lifecycle.dart';
import 'package:flutter_fgbg/flutter_fgbg.dart';

class FGBGLifecycle extends LifeCycle {
  final _stream = FGBGEvents.stream;

  @override
  StreamSubscription<AppStatus> listen(void Function(AppStatus event)? onData,
      {Function? onError, void Function()? onDone, bool? cancelOnError}) {
    return _stream
        .map((event) => (event == FGBGType.foreground)
            ? AppStatus.foreground
            : AppStatus.background)
        .listen(onData, onDone: onDone, onError: onError);
  }
}
