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
                  Text(
                    state is SignUpVerification
                        ? stringConstant.headerSignUpVerification
                        : stringConstant.headerSignUp,
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
                          child: state is SignUpVerification
                              ? CardSignUpVerification()
                              : CardSignUp(),
                        )),
                  ),
                ],
              ),
            ),
            Visibility(
              visible: state is SignUpVerification,
              child: IconButton(
                padding: EdgeInsets.only(
                  left: dimensionConstant.spacing16,
                ),
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: colorConstant.naturalWhite,
                ),
                onPressed: () => context.read<SignUpCubit>().goBackToSignUp(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
