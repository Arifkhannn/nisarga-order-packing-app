import 'package:equatable/equatable.dart';

class PackingState extends Equatable {
  final bool isLoading;
  final bool isSubmitting;
  final Set<String> packedItemIds; // 👈 important
  final String? error;

  const PackingState({
    required this.isLoading,
    required this.isSubmitting,
    required this.packedItemIds,
    this.error,
  });

  factory PackingState.initial() {
    return const PackingState(
      isLoading: false,
      isSubmitting: false,
      packedItemIds: {},
    );
  }

  PackingState copyWith({
    bool? isLoading,
    bool? isSubmitting,
    Set<String>? packedItemIds,
    String? error,
  }) {
    return PackingState(
      isLoading: isLoading ?? this.isLoading,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      packedItemIds: packedItemIds ?? this.packedItemIds,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        isSubmitting,
        packedItemIds,
        error,
      ];
}
