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
                  'Embark on your journey to a healthier you with our\nWeight Tracker app',
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
                            'Sign Up',
                            style: styleConstant.Text22Heading1(
                                customColor: colorConstant.splashYellow),
                          ),
                          SizedBox(
                            height: dimensionConstant.spacing20,
                          ),
                          customField.FieldText(title: 'Email'),
                          SizedBox(
                            height: dimensionConstant.spacing20,
                          ),
                          customField.FieldPassword(title: 'Password'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: customField.FieldText(
                                    title: 'Current Weight'),
                              ),
                              SizedBox(
                                width: dimensionConstant.spacing16,
                              ),
                              Expanded(
                                child: customField.FieldText(
                                    title: 'Weight Goals'),
                              ),
                            ],
                          ),
                          generalButtons.PrimaryButton(
                              function: () => context.read<SignUpCubit>().gotoSignInFromRegister(),
                              btnTitle: 'Sign Up'),
                          Container(
                            height: dimensionConstant.spacing20,
                            width: MediaQuery.of(context).size.width,
                          ),
                          Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                  text: 'or\n\n',
                                  style: styleConstant.Text12SmallText(),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'Already have an account? ',
                                      style: styleConstant.Text12SmallText(),
                                    ),
                                    TextSpan(
                                        text: 'Sign in',
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
