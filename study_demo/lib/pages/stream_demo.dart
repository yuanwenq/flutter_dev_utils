/*
 * @Date: 2023-03-06
 * @Desc: 
 */
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../model/model.dart';

class Lamp extends StatelessWidget {
  final Color? color;
  const Lamp({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
          color: color ?? Colors.grey.withOpacity(0.8), shape: BoxShape.circle),
    );
  }
}

class SignalLamp extends StatelessWidget {
  final SignalState state;
  const SignalLamp({super.key, required this.state});

  Color get activeColor {
    switch (state.type) {
      case SignalType.allow:
        return Colors.green;
      case SignalType.denial:
        return Colors.red;
      case SignalType.wait:
        return Colors.amber;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(30)),
          child: Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 15,
            children: [
              Lamp(color: state.type == SignalType.denial ? activeColor : null),
              Lamp(color: state.type == SignalType.wait ? activeColor : null),
              Lamp(color: state.type == SignalType.allow ? activeColor : null),
            ],
          ),
        ),
        Text(
          state.counter.toString(),
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 50, color: activeColor),
        )
      ],
    );
  }
}

class StreamPage extends StatefulWidget {
  const StreamPage({super.key});

  @override
  State<StreamPage> createState() => _StreamPageState();
}

class _StreamPageState extends State<StreamPage> {
  late StreamSubscription<SignalState> _subscription;
  final StreamController<SignalState> streamController = StreamController(
    onListen: () => print("======onListen====="),
    onPause: () => print("======onPause====="),
    onResume: () => print("======onResume====="),
    onCancel: () => print("======onCancel====="),
  );
  SignalState _signalState = SignalState(counter: 10, type: SignalType.denial);
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    _subscription = streamController.stream.listen(emit, onError: (err) async {
      print(err);
      renderError();
      await Future.delayed(const Duration(seconds: 3));
      fixError();
      emit(_signalState.next());
    }, cancelOnError: false);
    streamController.add(_signalState);
  }

  @override
  void dispose() {
    super.dispose();
    streamController.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stream demo"),
      ),
      body: Center(
        child: hasError
            ? const Text(
                'Error Signal State',
                style: TextStyle(fontSize: 24, color: Colors.red),
              )
            : SignalLamp(state: _signalState),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggle,
        child: Icon(_subscription.isPaused
            ? Icons.run_circle
            : Icons.stop_circle_outlined),
      ),
    );
  }

  void emit(SignalState state) async {
    _signalState = state;
    setState(() {});
    await Future.delayed(const Duration(seconds: 1));
    SignalState nextState = state.next();
    if (nextState.counter == 7 && nextState.type == SignalType.denial) {
      streamController.addError(Exception('Error Signal State'));
    } else {
      streamController.add(state.next());
    }
  }

  void _toggle() {
    if (_subscription.isPaused) {
      _subscription.resume();
    } else {
      _subscription.pause();
    }
    setState(() {});
  }

  void renderError() {
    hasError = true;
    setState(() {});
  }

  void fixError() {
    hasError = false;
    setState(() {});
  }
}
