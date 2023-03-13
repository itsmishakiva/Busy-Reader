import 'package:busy_reader/themes/theme_build_context_extension.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField>
    with SingleTickerProviderStateMixin {
  bool hasFocus = false;
  late AnimationController animController;
  final TextEditingController textController = TextEditingController();
  final FocusNode focus = FocusNode();

  @override
  void initState() {
    focus.addListener(() {
      if (!focus.hasFocus && textController.text.isEmpty) {
        animController.reverse();
      }
    });
    animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        animController.forward();
        focus.requestFocus();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: context.colors.cardColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 17),
        height: 56,
        width: double.infinity,
        child: AnimatedBuilder(
          animation: animController,
          builder: (context, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 9 + (1 - animController.value) * 8),
                Text(
                  widget.label,
                  style: context.textStyles.subtitle2!.copyWith(
                      fontSize: 10 + (1 - animController.value) * 6,
                      color: context.colors.hintColor,
                      height: 1.2),
                ),
                SizedBox(
                  height: 4 * animController.value,
                ),
                SizedBox(
                  height: 22 * animController.value,
                  child: TextField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                    style: context.textStyles.subtitle2!.copyWith(fontSize: 16),
                    controller: textController,
                    focusNode: focus,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
