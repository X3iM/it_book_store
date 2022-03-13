import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class NoInternetWrapper extends StatelessWidget {
  final Widget? child;

  const NoInternetWrapper({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _NoInternetToast(
        child: child,
      ),
    );
  }
}

class _NoInternetToast extends StatefulWidget {
  final Widget? child;

  const _NoInternetToast({Key? key, this.child}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _NoInternetWidget();
}

class _NoInternetWidget extends State<_NoInternetToast> {
  bool _internet = true;
  bool _show = false;

  final connectivity = Connectivity();

  late StreamSubscription<ConnectivityResult> subscription;

  void _check(ConnectivityResult result) {
    if (result == ConnectivityResult.none && _internet) {
      _show = true;
      _internet = false;
      setState(() {});
    } else if (result != ConnectivityResult.none && !_internet) {
      _show = true;
      _internet = true;
      setState(() {});

      Future.delayed(const Duration(seconds: 3)).then((_) {
        if (_internet) setState(() => _show = false);
      });
    }
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPersistentFrameCallback((timeStamp) async {
      _check(await connectivity.checkConnectivity());

      subscription = connectivity.onConnectivityChanged.listen((ConnectivityResult result) {
        _check(result);
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(child: widget.child!),
        AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: double.infinity,
          height: _show ? 30 : 0,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            color: _internet ? Colors.green.shade300 : Colors.red.shade400,
            child: Text(
              _internet ? 'You are online!' : 'You are offline!',
              style: TextStyle(color: Colors.white),
            ),
          ),
        )
      ],
    );
  }
}
