import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:my_campus/presentation/ui/screens/teacher_screens/auth_screens/fac_password_change_screen.dart';
import '../../../utility/image_assets.dart';

class RecoveryEmailScreen extends StatefulWidget {
  const RecoveryEmailScreen({super.key});

  @override
  State<RecoveryEmailScreen> createState() => _RecoveryEmailScreenState();
}

class _RecoveryEmailScreenState extends State<RecoveryEmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 112,
            ),
            const Text(
              'RECOVERY',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
            const Text(
              'A code will be send to your mail',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: Color(0xFF585858),
              ),
            ),
            const SizedBox(
              height: 46,
            ),
            SvgPicture.asset(
              ImageAssets.myCampusLogoSVG,
              width: 130,
              height: 117,
            ),
            const SizedBox(
              height: 65,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 205,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      hintText: 'Type your email',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 72,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      enabled: false,
                      hintText: '@lus.ac.bd',
                      hintStyle: TextStyle(
                          fontSize: 12,
                          color: Color(0xFF000000),
                          fontWeight: FontWeight.w700),
                      fillColor: Color(0xFFFFFFFF),
                      contentPadding: EdgeInsets.only(left: 4),
                      disabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 34,
            ),
            SizedBox(
              width: 277,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(
                    () => const PasswordChangeScreen(),
                  );
                },
                child: const Text('SUBMIT'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
