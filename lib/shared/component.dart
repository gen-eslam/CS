import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultFormField({
  required context,
  TextEditingController? controller,
  dynamic label,
  IconData? prefix,
  String? initialValue,
  TextInputType? keyboardType,
  Function(String)? onSubmit,
  onChange,
  onTap,
  required String? Function(String?) validate,
  bool isPassword = false,
  bool enabled = true,
  IconData? suffix,
  suffixPressed,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isPassword,
      textAlign: TextAlign.start,
      onFieldSubmitted: onSubmit,
      enabled: enabled,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      textCapitalization: TextCapitalization.words,
      textAlignVertical: TextAlignVertical.center,
      style: Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.blueGrey),

      initialValue: initialValue,

      //textCapitalization: TextCapitalization.words,

      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(
          color: Colors.grey,
        ),
        border: UnderlineInputBorder(),
        prefixIcon: Icon(
          prefix,
          color: Theme.of(context).iconTheme.color,
        ),
        suffixIcon: suffix != null
            ? IconButton(
            onPressed: suffixPressed,
            icon: Icon(
              suffix,
              color: Theme.of(context).iconTheme.color,
            ))
            : null,
      ),
    );

Widget defaultTextButton(
    {required String text,
    required Function() onPressed,
      Color? color,
    bool isUpper = false,
    context}) {
  if (isUpper) text = text.toUpperCase();
  return Container(
    child: TextButton(
      child: Text(
        '${text}',style: TextStyle(color:color ?? Colors.blue ),
      ),
      onPressed: onPressed,
    ),
  );
}
enum SnackState { SUCCESS, ERROR, WARNING }

Color chooseSnackColor(SnackState state) {
  Color color;
  switch (state) {
    case SnackState.SUCCESS:
      color = Colors.green;
      break;
    case SnackState.ERROR:
      color = Colors.red;
      break;
    case SnackState.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
SnackBar snakBar({required String text, required SnackState state}) {
  return SnackBar(
    content: Text(text),
    backgroundColor: chooseSnackColor(state),
    duration: Duration(
      seconds: 2,
    ),
  );
}

void navigateTo(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateAndKill(context, widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

void pop(context) {
  Navigator.pop(context);
}
