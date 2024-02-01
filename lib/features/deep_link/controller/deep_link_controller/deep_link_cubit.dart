import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

part 'deep_link_state.dart';

class DeepLinkCubit extends Cubit<DeepLinkState> {
  DeepLinkCubit() : super(DeepLinkInitial());
  StreamSubscription? _sub;
  bool _initialUriIsHandled = false;

  void handleIncomingLinks({required BuildContext context}) {
    if (!kIsWeb) {
      // It will handle app links while the app is already started - be it in
      // the foreground or in the background.
      _sub = uriLinkStream.listen((Uri? uri) {
        // if (!mounted) return;
        if (uri!.queryParameters.containsKey('movieId')) {
          debugPrint('The QueryParams Is ${uri.queryParameters.containsKey('movieId')}');
          final int movieId = int.parse(
            uri.queryParameters['movieId']!,
          );
          debugPrint('The Movie Id Is $movieId');
          emit(
            DeepLinkNavigationLoadedState(movieId: movieId),
          );
        }
      }, onError: (Object err) {
        emit(DeepLinkNavigationFailState());
        // if (!mounted) return;
        debugPrint('got err: $err');
      });
    }
  }

  Future<void> handleInitialUri() async {
    // In this example app this is an almost useless guard, but it is here to
    // show we are not going to call getInitialUri multiple times, even if this
    // was a weidget that will be disposed of (ex. a navigation route change).
    if (!_initialUriIsHandled) {
      _initialUriIsHandled = true;
      try {
        final uri = await getInitialUri();
        if (uri == null) {
          debugPrint('no initial uri');
        } else {
          if (uri.queryParameters.containsKey('moviedetails')) {
            debugPrint(
                'The QueryParams Is ${uri.queryParameters.containsKey('moviedetails')}');
          }
        }
      } on PlatformException {
        // Platform messages may fail but we ignore the exception
        debugPrint('falied to get initial uri');
      }
    }
  }
  void onClose() {
    _sub?.cancel();
  }

}
