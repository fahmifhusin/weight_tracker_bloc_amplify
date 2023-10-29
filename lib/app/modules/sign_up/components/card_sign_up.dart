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
        ),
        customField.FieldText(
          title: stringConstant.email,
          teController: context.read<SignUpCubit>().tecEmail,
        ),
        customField.FieldText(
          title: stringConstant.phoneNumber,
          teController:
          context.read<SignUpCubit>().tecPhoneNumber,
        ),
        customField.FieldPassword(
          title: stringConstant.password,
          teController:
          context.read<SignUpCubit>().tecPassword,
        ),
        customField.FieldPassword(
          title: stringConstant.confirmPassword,
          teController:
          context.read<SignUpCubit>().tecPasswordConfirm,
        ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Expanded(
        //       child: customField.FieldText(
        //         title: stringConstant.currentWeight,
        //         teController: context
        //             .read<SignUpCubit>()
        //             .tecCurrentWeight,
        //       ),
        //     ),
        //     SizedBox(
        //       width: dimensionConstant.spacing16,
        //     ),
        //     Expanded(
        //       child: customField.FieldText(
        //         title: stringConstant.weightGoals,
        //         teController: context
        //             .read<SignUpCubit>()
        //             .tecWeightGoals,
        //       ),
        //     ),
        //   ],
        // ),
        BlocBuilder<SignUpCubit, SignUpState>(
          builder: (ctx, state) =>
              generalButtons.PrimaryButton(
                  isLoading: state is SignUpLoading,
                  function: () =>
                      ctx.read<SignUpCubit>().doSignUp(),
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
                          customColor:
                          colorConstant.primaryBlue),
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
