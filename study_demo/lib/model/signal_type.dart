/*
 * @Date: 2023-03-06
 * @Desc: 
 */
const int _kAllowMaxCount = 10;
const int _kWaitMaxCount = 3;
const int _kDenialMaxCount = 10;

class SignalState {
  final int counter;
  final SignalType type;

  SignalState({required this.counter, required this.type});

  SignalState next() {
    if (counter > 1) {
      return SignalState(counter: counter - 1, type: type);
    } else {
      switch (type) {
        case SignalType.allow:
          return SignalState(
              counter: _kDenialMaxCount, type: SignalType.denial);
        case SignalType.denial:
          return SignalState(counter: _kWaitMaxCount, type: SignalType.wait);
        case SignalType.wait:
          return SignalState(counter: _kAllowMaxCount, type: SignalType.allow);
      }
    }
  }
}

enum SignalType {
  allow, // 允许 - 绿灯
  denial, // 拒绝 - 红灯
  wait // 等待 - 黄灯
}
