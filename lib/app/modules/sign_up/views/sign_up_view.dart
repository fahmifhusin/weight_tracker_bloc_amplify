part of sign_up_lib;

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return styleConstant.GeneralAppPage(
      body: BlocBuilder<SignUpCubit, SignUpState>(
        builder: (ctx, state) => Stack(
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
                  state is SignUpVerification
                      ? RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                              text:
                                  '${stringConstant.headerSignUpVerification}\n',
                              style: styleConstant.Text22Heading1(
                                  customHeight: 1.5,
                                  customColor: colorConstant.naturalWhite),
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      context.read<SignUpCubit>().tecEmail.text,
                                  style: styleConstant.Text20Heading1(
                                    customHeight: 1.5,
                                  ),
                                ),
                              ]),
                        )
                      : Text(
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
                          child: state is SignUpVerification ||
                                  state is SignUpFormCodeVerified ||
                                  state is SignUpLoadCodeVerified
                              ? CardSignUpVerification()
                              : CardSignUp(),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
