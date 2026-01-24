import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nisarga_order_packing/core/theme/app_Color.dart';
import 'package:nisarga_order_packing/feature/packing/logic/packing_cubit.dart';
import 'package:nisarga_order_packing/feature/packing/logic/packing_state.dart';

class MarkPackedButton extends StatelessWidget {
  const MarkPackedButton();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PackingCubit, PackingState>(
      builder: (context, state) {
        final cubit = context.read<PackingCubit>();
        final enabled = cubit.isAllPacked;

        return Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: enabled && !state.isSubmitting
                  ? cubit.markOrderPacked
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    enabled ? AppColors.warning : Colors.grey.shade300,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                elevation: 0,
              ),
              child: state.isSubmitting
                  ? const CircularProgressIndicator()
                  : const Text(
                      'Mark Packed',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}
