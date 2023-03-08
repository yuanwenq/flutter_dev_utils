/*
 * @Date: 2023-03-08
 * @Desc: 
 */
import 'package:study_demo/model/model.dart';
import 'package:study_demo/var/var.dart';

class StopWatchState {
  final StopWatchType type;
  final List<TimeRecord> durationRecord;
  final Duration duration;

  Duration get secondDuration {
    if (durationRecord.isNotEmpty) {
      return duration - durationRecord.last.record;
    }
    return duration;
  }

  const StopWatchState(
      {this.type = StopWatchType.none,
      this.durationRecord = const [],
      this.duration = Duration.zero});

  StopWatchState copyWith(
      {StopWatchType? type,
      List<TimeRecord>? durationRecord,
      Duration? duration}) {
    return StopWatchState(
        type: type ?? this.type,
        durationRecord: durationRecord ?? this.durationRecord,
        duration: duration ?? this.duration);
  }
}
