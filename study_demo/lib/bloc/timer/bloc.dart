/*
 * @Date: 2023-03-08
 * @Desc: 
 */
import 'dart:async';

import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_demo/model/model.dart';
import 'package:study_demo/var/var.dart';

import 'timer.dart';

part 'event.dart';

class StopWatchBloc extends Bloc<StopWatchEvent, StopWatchState> {
  Ticker? _ticker;

  StopWatchBloc() : super(const StopWatchState()) {
    on<ToggleStopWatch>(_onToggleStopWatch);
    on<ResetStopWatch>(_onResetStopWatch);
    on<RecordeStopWatch>(_onRecordeStopWatch);
    on<_UpdateDuration>(_onUpdateDuration);
  }

  // 开启与暂停
  void _onToggleStopWatch(ToggleStopWatch event, Emitter<StopWatchState> emit) {
    _initTickerWhenNull();
    if (_ticker!.isTicking) {
      _ticker!.stop();
      _lastDuration = Duration.zero;
      emit(state.copyWith(type: StopWatchType.stopped));
    } else {
      _ticker!.start();
      emit(state.copyWith(type: StopWatchType.running));
    }
  }

  // 重置
  void _onResetStopWatch(ResetStopWatch event, Emitter<StopWatchState> emit) {
    _lastDuration = Duration.zero;
    _dt = Duration.zero;
    emit(const StopWatchState());
  }

  // 记录
  void _onRecordeStopWatch(
      RecordeStopWatch event, Emitter<StopWatchState> emit) {
    List<TimeRecord> currentList = state.durationRecord.map((e) => e).toList();
    Duration current = state.duration;
    Duration addition = state.duration;
    if (currentList.isNotEmpty) {
      addition = current - currentList.last.record;
    }
    currentList.add(TimeRecord(record: current, addition: addition));
    emit(state.copyWith(durationRecord: currentList));
  }

  // 产出新状态
  void _onUpdateDuration(_UpdateDuration event, Emitter<StopWatchState> emit) {
    emit(state.copyWith(duration: event.duration));
  }

  void _initTickerWhenNull() {
    if (_ticker != null) return;
    _ticker = Ticker(_onTick);
  }

  Duration _dt = Duration.zero;
  Duration _lastDuration = Duration.zero;

  void _onTick(Duration elapsed) {
    _dt = elapsed - _lastDuration;
    add(_UpdateDuration(state.duration + _dt));
    _lastDuration = elapsed;
  }

  @override
  Future<void> close() async {
    _ticker?.dispose();
    _ticker = null;
    return super.close();
  }
}
