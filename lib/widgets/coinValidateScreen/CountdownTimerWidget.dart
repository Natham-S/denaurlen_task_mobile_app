import 'dart:async';
import 'package:flutter/material.dart';
import 'TimeBox.dart';

class CountdownTimerWidget extends StatefulWidget {
  final Duration initialDuration;

  const CountdownTimerWidget({Key? key, required this.initialDuration}) : super(key: key);

  @override
  _CountdownTimerWidgetState createState() => _CountdownTimerWidgetState();
}

class _CountdownTimerWidgetState extends State<CountdownTimerWidget> {
  late Duration remainingTime;
  late Timer countdownTimer;

  @override
  void initState() {
    super.initState();

    remainingTime = widget.initialDuration;

    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => updateTimer());
  }

  void updateTimer() {
    if (remainingTime.inSeconds > 0) {
      setState(() {
        remainingTime = remainingTime - const Duration(seconds: 1);
      });
    } else {
      countdownTimer.cancel();
    }
  }

  @override
  void dispose() {
    countdownTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final hours = remainingTime.inHours.toString().padLeft(2, '0');
    final minutes = (remainingTime.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (remainingTime.inSeconds % 60).toString().padLeft(2, '0');

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TimeBox(value: hours),
        const SizedBox(width: 4),
        Text(':', style: theme.textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.secondary,
        )),
        const SizedBox(width: 4),
        TimeBox(value: minutes),
        const SizedBox(width: 4),
        Text(':', style: theme.textTheme.bodySmall?.copyWith(
          color: Theme.of(context).colorScheme.secondary,
        )),
        const SizedBox(width: 4),
        TimeBox(value: seconds),
      ],
    );
  }
}
