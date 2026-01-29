import 'package:equatable/equatable.dart';

class PackingState extends Equatable {
  final bool isLoading;
  final bool isSubmitting;
  final Set<String> packedItemIds; // 👈 important
  final String? error;
  final bool packedSucess;

  const PackingState({
    required this.isLoading,
    required this.isSubmitting,
    required this.packedItemIds,
    this.error,
    required this.packedSucess
  });

  factory PackingState.initial() {
    return const PackingState(
      isLoading: false,
      isSubmitting: false,
      packedItemIds: {},
      packedSucess: false
    );
  }

  PackingState copyWith({
    bool? isLoading,
    bool? isSubmitting,
    Set<String>? packedItemIds,
    String? error,
    bool? packedSucess
  }) {
    return PackingState(
      isLoading: isLoading ?? this.isLoading,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      packedItemIds: packedItemIds ?? this.packedItemIds,
      error: error,
      packedSucess: packedSucess?? this.packedSucess

    );
  }

  @override
  List<Object?> get props => [isLoading, isSubmitting, packedItemIds, error, packedSucess];
}
