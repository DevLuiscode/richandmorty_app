part of 'detail_bloc.dart';

enum DetailStatus { initial, loading, succes, error }

class DetailState extends Equatable {
  final DetailStatus detailStatus;
  final ByCharterEntity byCharterEntity;
  const DetailState({
    required this.detailStatus,
    required this.byCharterEntity,
  });

  DetailState copyWith({
    DetailStatus? detailStatus,
    ByCharterEntity? byCharterEntity,
  }) =>
      DetailState(
        detailStatus: detailStatus ?? this.detailStatus,
        byCharterEntity: byCharterEntity ?? this.byCharterEntity,
      );

  @override
  List<Object> get props => [detailStatus, byCharterEntity];
}
