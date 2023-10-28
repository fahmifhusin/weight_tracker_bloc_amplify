part of sign_in_lib;

class SignInView extends StatelessWidget {
  const SignInView({super.key});

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
                  'Sign In to access your\nWeight Tracker & Activity',
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
                            'Sign in',
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
                          generalButtons.PrimaryButton(
                              function: () => logger.d('tap'),
                              btnTitle: 'Sign In'),
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
                                      text: 'Don\'t have an account? ',
                                      style: styleConstant.Text12SmallText(),
                                    ),
                                    TextSpan(
                                      text: 'Sign Up',
                                      style: styleConstant.Text12SmallText(
                                          customColor:
                                              colorConstant.primaryBlue),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () => context
                                            .read<SignInCubit>()
                                            .gotoSignupFromLogin(),
                                    ),
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
