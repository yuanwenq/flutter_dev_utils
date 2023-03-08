/*
 * @Date: 2023-03-07
 * @Desc: 
 */
/*
 * @Date: 2023-03-06
 * @Desc: 
 */
import 'package:flutter/material.dart';
import 'package:study_demo/pages/timer_page.dart';

class ButtonTools extends StatelessWidget {
  final StopWatchType state;
  final VoidCallback? onReset;
  final VoidCallback? toggle;
  final VoidCallback? onRecoder;

  const ButtonTools(
      {super.key,
      required this.state,
      this.onReset,
      this.toggle,
      this.onRecoder});

  @override
  Widget build(BuildContext context) {
    bool running = state == StopWatchType.running;
    bool stopped = state == StopWatchType.stopped;
    Color activeColor = const Color(0xff3A3A3A);
    Color inactiveColor = const Color(0xffDDDDDD);
    Color resetColor = stopped ? activeColor : inactiveColor;
    Color flagColor = running ? activeColor : inactiveColor;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 50,
        children: [
          if (state != StopWatchType.none)
            GestureDetector(
              onTap: stopped ? onReset : null,
              child: Icon(
                Icons.refresh,
                size: 28,
                color: resetColor,
              ),
            ),
          FloatingActionButton(
            onPressed: toggle,
            backgroundColor: Theme.of(context).primaryColor,
            child:
                running ? const Icon(Icons.stop) : const Icon(Icons.play_arrow),
          ),
          if (state != StopWatchType.none)
            GestureDetector(
              onTap: running ? onRecoder : null,
              child: Icon(
                Icons.flag_outlined,
                size: 28,
                color: flagColor,
              ),
            ),
        ],
      ),
    );
  }
}
