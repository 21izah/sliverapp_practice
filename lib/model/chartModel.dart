class ChartModel {
  int time;
  double? open;
  double? high;
  double? low;
  double? close;

  ChartModel({
    required this.time,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
  });

  factory ChartModel.fromJson(List U) => ChartModel(
        time: U[0] == null ? null : U[0]!,
        open: U[1] == null ? null : U[1]!,
        high: U[2] == null ? null : U[2]!,
        low: U[3] == null ? null : U[3]!,
        close: U[4] == null ? null : U[4]!,
      );

  // factory ChartModel.fromJson(List i ) =>

  //    ChartModel(time: i[0] == null ? null : i[0]!);
}
