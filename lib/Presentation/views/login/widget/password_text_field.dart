
import 'package:flutter/material.dart';
import 'package:my_gallery/Presentation/view_models/login_view_model/password/pass_provider.dart';
import 'package:my_gallery/Presentation/views/login/widget/custom_text_field.dart';
import 'package:provider/provider.dart';

class PasswordTextFieldWidget extends StatelessWidget {
  const PasswordTextFieldWidget({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
        PasswordProvider passwordProvider = Provider.of<PasswordProvider>(context);

    return CustomTextField(
      hintName: 'Password',
      isSecure: passwordProvider.passSecure,
      sufix: passwordProvider.passSecure
          ? IconButton(
              onPressed: () {
                passwordProvider.changePassSecure(
                    !passwordProvider.passSecure);
              },
              icon: const Icon(
                Icons.visibility_off,
              ),
              enableFeedback: false,
            )
          : IconButton(
              onPressed: () {
                passwordProvider.changePassSecure(
                    !passwordProvider.passSecure);
              },
              icon: const Icon(Icons.visibility),
              enableFeedback: false,
            ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "this field can't be empty";
        }
        return null;
      },
      controller: passwordController,
    );
  }
}
