part of sign_up_lib;

class CardSignUpVerification extends StatelessWidget {
  const CardSignUpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          'Hi, ${context.read<SignUpCubit>().tecName.text}',
          style: styleConstant.Text22Heading1(
              customColor: colorConstant.splashYellow),
        ),
        customField.FieldText(
            title: stringConstant.verificationCode,
            teController: context.read<SignUpCubit>().tecVerifCode),
        BlocBuilder<SignUpCubit, SignUpState>(
          builder: (ctx, state) => generalButtons.PrimaryButton(
              isLoading: state is SignUpLoading,
              function: () => ctx.read<SignUpCubit>().verifyCodeSignUp(),
              btnTitle: stringConstant.verifySignUp),
        ),
        Container(
          height: dimensionConstant.spacing20,
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }
}
