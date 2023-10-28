part of sign_up_lib;

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return styleConstant.GeneralAppPage(
      body: Stack(
        children: [
          Container(
            height: functionSharing.screenHeight * 0.4,
            width: functionSharing.screenWidth,
            decoration: BoxDecoration(
                color: colorConstant.splashYellow,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(dimensionConstant.spacing16),
                  bottomRight: Radius.circular(
                    dimensionConstant.spacing16,
                  ),
                )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                dimensionConstant.spacing16,
                functionSharing.screenHeight * 0.05,
                dimensionConstant.spacing16,
                dimensionConstant.spacing24),
            child: Column(
              children: [
                Text(
                  stringConstant.headerSignUp,
                  textAlign: TextAlign.center,
                  style: styleConstant.Text22Heading1(
                      customHeight: 1.5,
                      customColor: colorConstant.naturalWhite),
                ),
                SizedBox(
                  height: dimensionConstant.spacing20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          dimensionConstant.spacing10,
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: dimensionConstant.spacing20,
                        horizontal: dimensionConstant.spacing16,
                      ),
                      child: Wrap(
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: customField.FieldText(
                                  title: stringConstant.currentWeight,
                                  teController: context
                                      .read<SignUpCubit>()
                                      .tecCurrentWeight,
                                ),
                              ),
                              SizedBox(
                                width: dimensionConstant.spacing16,
                              ),
                              Expanded(
                                child: customField.FieldText(
                                  title: stringConstant.weightGoals,
                                  teController: context
                                      .read<SignUpCubit>()
                                      .tecWeightGoals,
                                ),
                              ),
                            ],
                          ),
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
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
