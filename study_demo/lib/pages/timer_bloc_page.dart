/*
 * @Date: 2023-03-08
 * @Desc: 
 */
/*
 * @Date: 2023-03-05
 * @Desc: 
 */
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:study_demo/pages/setting_page.dart';

import '../components/components.dart';
import '../model/model.dart';
import '../var/var.dart';

class TimerBlocPage extends StatefulWidget {
  const TimerBlocPage({super.key});

  @override
  State<TimerBlocPage> createState() => _TimerBlocPageState();
}

class _TimerBlocPageState extends State<TimerBlocPage> {
  late Ticker _ticker;
  StopWatchType _type = StopWatchType.none;
  // Duration _duration = Duration.zero;
  Duration dt = Duration.zero;
  Duration lastDuration = Duration.zero;
  final List<TimeRecord> _record = [];
  ValueNotifier<Duration> _duration = ValueNotifier(Duration.zero);

  @override
  void initState() {
    super.initState();
    _ticker = Ticker(_onTick);
  }

  @override
  void dispose() {
    super.dispose();
    _ticker.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("计时器"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: buildActions(),
      ),
      body: Column(
        children: [
          buildStopwatchPanel(),
          buildRecordPanel(),
          buildTools(),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // 负责构建秒表面板
  Widget buildStopwatchPanel() {
    double radius = MediaQuery.of(context).size.width / 2 * 0.75;
    return ValueListenableBuilder<Duration>(
        valueListenable: _duration,
        builder: (_, value, __) => StopwatchWidget(
              radius: radius,
              duration: _duration.value,
              themeColor: Theme.of(context).primaryColor,
            ));
  }

  // 负责构建记录面板
  Widget buildRecordPanel() {
    return Expanded(
      child: RecordPanel(record: _record),
    );
  }

  // 负责构建逻辑操作按钮
  Widget buildTools() {
    return ButtonTools(
      state: _type,
      onReset: onReset,
      onRecoder: onRecoder,
      toggle: toggle,
    );
  }

  List<Widget> buildActions() {
    return [
      PopupMenuButton<String>(
        itemBuilder: _buildItem,
        onSelected: _onSelectItem,
        icon: const Icon(
          Icons.more_vert_outlined,
          color: Color(0xff262626),
        ),
        position: PopupMenuPosition.under,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
      )
    ];
  }

  List<PopupMenuEntry<String>> _buildItem(BuildContext context) {
    return const [
      PopupMenuItem<String>(
          value: '设置',
          child: Center(
            child: Text('设置'),
          ))
    ];
  }

  void _onSelectItem(String value) {
    if (value == "设置") {
      // Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SettingPage()));
      Navigator.of(context).push(Right2LeftRouter(child: const SettingPage()));
    }
  }

  void onReset() {
    setState(() {
      _duration = ValueNotifier(Duration.zero);
      _type = StopWatchType.none;
      _record.clear();
    });
  }

  void onRecoder() {
    Duration current = _duration.value;
    Duration addition = _duration.value;
    if (_record.isNotEmpty) {
      addition = _duration.value - _record.last.record;
    }
    setState(() {
      _record.add(TimeRecord(record: current, addition: addition));
    });
  }

  void toggle() {
    bool running = _type == StopWatchType.running;
    if (running) {
      _ticker.stop();
      lastDuration = Duration.zero;
    } else {
      _ticker.start();
    }
    setState(() {
      _type = running ? StopWatchType.stopped : StopWatchType.running;
    });
  }

  void _onTick(Duration elapsed) {
    dt = elapsed - lastDuration;
    _duration.value += dt;
    lastDuration = elapsed;
  }
}
