/*
 * @Date: 2023-03-06
 * @Desc: 
 */
class TaskResult {
  final int cost;
  final String taskName;
  final dynamic data;

  TaskResult({required this.cost, required this.taskName, required this.data});

  Map<String, dynamic> toJson() => {
        "taskName": taskName,
        "cost": cost,
        "data": data,
      };
}
