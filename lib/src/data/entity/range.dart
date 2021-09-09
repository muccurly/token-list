import 'package:equatable/equatable.dart';

class Range extends Equatable {
  final int from;
  final int to;

  const Range(this.from, this.to);

  Range.fromJson(Map<String, dynamic> json)
      : from = json['from'],
        to = json['to'];

  Map<String, dynamic> toJson() => {'from': this.from, 'to': this.to};

  @override
  List<Object?> get props => [from, to];
}
