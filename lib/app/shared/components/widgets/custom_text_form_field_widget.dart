import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String labelText;
  final String? hintText;
  final String? errorText;
  final Widget? prefixIcon;
  final bool enabled;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? onValidator;
  final Function(String)? onSaved;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final VoidCallback? onTap;

  const CustomTextFormFieldWidget({
    Key? key,
    this.controller,
    required this.labelText,
    this.focusNode,
    this.hintText,
    this.errorText,
    this.prefixIcon,
    this.enabled = true,
    this.obscureText = false,
    this.textInputAction = TextInputAction.next,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.onValidator,
    this.onSaved,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: MediaQuery.of(context).size.width / 1.2,
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(labelText, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          TextFormField(
            controller: controller,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            focusNode: focusNode,
            enableInteractiveSelection: enabled,
            readOnly: !enabled,
            obscureText: obscureText,
            textInputAction: textInputAction,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            decoration: _getInputDecoration(context),
            validator: onValidator,
            onSaved: (v) => onSaved?.call(v ?? ''),
            onChanged: onChanged,
            onFieldSubmitted: onSubmitted,
            onTap: () {
              if (!enabled) FocusScope.of(context).requestFocus(FocusNode());
              onTap?.call();
            },
          ),
        ],
      ),
    );
  }

  InputDecoration _getInputDecoration(BuildContext context) {
    var backgroundColor =
        Get.isDarkMode ? Theme.of(context).backgroundColor.withOpacity(0.3) : Colors.grey[200];

    return InputDecoration(
      filled: true,
      fillColor: backgroundColor,
      hintText: hintText,
      hintStyle: const TextStyle(fontSize: 16, color: Colors.grey),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide(width: 2, color: Theme.of(context).accentColor),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide.none,
      ),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        borderSide: const BorderSide(width: 2, color: Colors.redAccent),
      ),
    );
  }

  bool _isDarkMode(BuildContext context) {
    var brightness = MediaQuery.of(context).platformBrightness;
    return brightness == Brightness.dark;
  }
}
