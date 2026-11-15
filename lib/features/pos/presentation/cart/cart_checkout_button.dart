import 'package:flutter/material.dart';

class CartCheckoutButton extends StatelessWidget {
  const CartCheckoutButton({
    super.key,
    required this.isBusy,
    required this.enabled,
    required this.onPressed,
  });

  final bool isBusy;
  final bool enabled;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final compact = MediaQuery.sizeOf(context).height < 650;

    return SizedBox(
      width: double.infinity,
      height: compact ? 51 : 58,
      child: FilledButton.icon(
        onPressed: enabled && !isBusy ? onPressed : null,
        icon: isBusy
            ? const SizedBox(
                width: 19,
                height: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Colors.white,
                ),
              )
            : const Icon(Icons.point_of_sale_rounded),
        label: Text(
          isBusy ? 'جارٍ تنفيذ العملية...' : 'إتمام عملية البيع',
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(13),
          ),
        ),
      ),
    );
  }
}
