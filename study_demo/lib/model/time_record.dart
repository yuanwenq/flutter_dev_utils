/*
 * @Date: 2023-03-07
 * @Desc: 
 */
/*
 * @Date: 2023-03-06
 * @Desc: 
 */
class TimeRecord {
  final Duration record; // 当前时刻
  final Duration addition; // 与上一时刻差值

  const TimeRecord({required this.record, required this.addition});
}
