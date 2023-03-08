/*
 * @Date: 2023-03-08
 * @Desc: 
 */
/*
 * @Date: 2023-03-05
 * @Desc: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_demo/bloc/bloc.dart';
import 'package:study_demo/pages/setting_page.dart';

import '../components/components.dart';

class TimerBlocPage extends StatefulWidget {
  const TimerBlocPage({super.key});

  @override
  State<TimerBlocPage> createState() => _TimerBlocPageState();
}

class _TimerBlocPageState extends State<TimerBlocPage> {
  StopWatchBloc get stopWatchBloc => BlocProvider.of<StopWatchBloc>(context);

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
    return BlocBuilder<StopWatchBloc, StopWatchState>(
        buildWhen: (p, n) => p.duration != n.duration, // 控制是否触发更新
        builder: (_, state) => StopwatchWidget(
              radius: radius,
              duration: state.duration,
              themeColor: Theme.of(context).primaryColor,
            ));
  }

  // 负责构建记录面板
  Widget buildRecordPanel() {
    return Expanded(
      child: BlocBuilder<StopWatchBloc, StopWatchState>(
          buildWhen: (p, n) => p.durationRecord != n.durationRecord,
          builder: (_, state) => RecordPanel(record: state.durationRecord)),
    );
  }

  // 负责构建逻辑操作按钮
  Widget buildTools() {
    return BlocBuilder<StopWatchBloc, StopWatchState>(
        buildWhen: (p, n) => p.type != n.type,
        builder: (_, state) => ButtonTools(
              state: state.type,
              onReset: onReset,
              onRecoder: onRecoder,
              toggle: toggle,
            ));
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

  void onReset() => stopWatchBloc.add(const ResetStopWatch());

  void onRecoder() => stopWatchBloc.add(const RecordeStopWatch());

  void toggle() => stopWatchBloc.add(const ToggleStopWatch());
}
