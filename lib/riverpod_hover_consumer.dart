import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RiverpodHoverConsumer extends ConsumerWidget {
  /// * [context] BuildContext
  /// * [ref] Riverpod WidgetRef
  /// * [isHovering] boolean that will be true if the mouse is hovering over the widget
  final Widget Function(BuildContext context, WidgetRef ref, bool isHovering) builder;
  final StateProvider<bool> isHoveringProvider = StateProvider<bool>((_) => false);
  /// * [context] BuildContext
  /// * [ref] Riverpod WidgetRef
  /// * [isHovering] boolean that will be true if the mouse is hovering over the widget
  final void Function(BuildContext context, WidgetRef ref, bool isHovering)? onTap;

  RiverpodHoverConsumer({super.key, required this.builder, this.onTap});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isHovering = ref.watch(isHoveringProvider);
    return InkWell(
      onTap: () => (onTap != null) ? onTap!(context, ref, isHovering) : null,
      onHover: (isHovering) => ref.read(isHoveringProvider.notifier).state = isHovering,
      child: builder(context, ref, isHovering),
    );
  }
}
