part of sign_up_lib;

class CardSignUp extends StatelessWidget {
  const CardSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          stringConstant.signUp,
          style: styleConstant.Text22Heading1(
              customColor: colorConstant.splashYellow),
        ),
        customField.FieldText(
            title: stringConstant.name,
            teController: context.read<SignUpCubit>().tecName,
            onChange: (_) => context.read<SignUpCubit>().verifySignUpForm()),
        customField.FieldText(
            title: stringConstant.email,
            teController: context.read<SignUpCubit>().tecEmail,
            inputType: TextInputType.emailAddress,
            onChange: (_) => context.read<SignUpCubit>().verifySignUpForm()),
        customField.FieldText(
            title: stringConstant.phoneNumber,
            teController: context.read<SignUpCubit>().tecPhoneNumber,
            inputType: TextInputType.number,
            onChange: (_) => context.read<SignUpCubit>().verifySignUpForm()),
        customField.FieldPassword(
            title: stringConstant.password,
            teController: context.read<SignUpCubit>().tecPassword,
            onChange: (_) => context.read<SignUpCubit>().verifySignUpForm()),
        customField.FieldPassword(
            title: stringConstant.confirmPassword,
            teController: context.read<SignUpCubit>().tecPasswordConfirm,
            onChange: (_) => context.read<SignUpCubit>().verifySignUpForm()),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: customField.FieldText(
                title: stringConstant.currentWeight,
                teController: context.read<SignUpCubit>().tecCurrentWeight,
                onChange: (_) => context.read<SignUpCubit>().verifySignUpForm(),
              ),
            ),
            SizedBox(
              width: dimensionConstant.spacing16,
            ),
            Expanded(
              child: customField.FieldText(
                title: stringConstant.weightGoals,
                teController: context.read<SignUpCubit>().tecWeightGoals,
                onChange: (_) => context.read<SignUpCubit>().verifySignUpForm(),
              ),
            ),
          ],
        ),
        BlocBuilder<SignUpCubit, SignUpState>(
          builder: (ctx, state) => generalButtons.PrimaryButton(
              isActive: state is SignUpFormVerified || state is SignUpLoading,
              isLoading: state is SignUpLoading,
              function: () => state is SignUpLoading
                  ? null
                  : ctx.read<SignUpCubit>().doSignUp(),
              btnTitle: stringConstant.signUp),
        ),
        Container(
          height: dimensionConstant.spacing20,
          width: MediaQuery.of(context).size.width,
        ),
        Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: '${stringConstant.or}\n\n',
                style: styleConstant.Text12SmallText(),
                children: <TextSpan>[
                  TextSpan(
                    text: stringConstant.alreadyHaveAccount,
                    style: styleConstant.Text12SmallText(),
                  ),
                  TextSpan(
                      text: stringConstant.signIn,
                      style: styleConstant.Text12SmallText(
                          customColor: colorConstant.primaryBlue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () => context
                            .read<SignUpCubit>()
                            .gotoSignInFromRegister())
                ]),
          ),
        ),
      ],
    );
  }
}
