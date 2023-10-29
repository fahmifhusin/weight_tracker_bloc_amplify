part of sign_up_lib;

class CardSignUpVerification extends StatelessWidget {
  const CardSignUpVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          '${stringConstant.hi} ${context.read<SignUpCubit>().tecName.text}',
          style: styleConstant.Text22Heading1(
              customColor: colorConstant.splashYellow),
        ),
        customField.FieldText(
            title: stringConstant.verificationCode,
            teController: context.read<SignUpCubit>().tecVerifCode,
            inputType: TextInputType.number,
            onChange: (_) =>
                context.read<SignUpCubit>().verifySignUpVerificationForm()),
        BlocBuilder<SignUpCubit, SignUpState>(
          builder: (ctx, state) => generalButtons.PrimaryButton(
            isActive: state is SignUpFormCodeVerified || state is SignUpLoadCodeVerified,
            isLoading: state is SignUpLoadCodeVerified,
            function: () => ctx.read<SignUpCubit>().verifyCodeSignUp(),
            btnTitle: stringConstant.verifySignUp,
          ),
        ),
        Container(
          height: dimensionConstant.spacing20,
          width: MediaQuery.of(context).size.width,
        ),
      ],
    );
  }
}
