import 'package:flutter/material.dart';
import 'package:my_campus/presentation/ui/widgets/app_logo.dart';
import 'package:my_campus/presentation/ui/widgets/screen_background.dart';

class StuPasswordChangeScreen extends StatefulWidget {
  const StuPasswordChangeScreen({super.key});

  @override
  State<StuPasswordChangeScreen> createState() =>
      _StuPasswordChangeScreenState();
}

class _StuPasswordChangeScreenState extends State<StuPasswordChangeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackground(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 112,
                ),
                const Text(
                  'CHANGE',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
                const Text(
                  'Set your password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF585858),
                  ),
                ),
                const SizedBox(
                  height: 46,
                ),
                const AppLogo(),
                const SizedBox(
                  height: 65,
                ),
                SizedBox(
                  width: 277,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.next,
                        obscureText: true,
                        decoration:
                            const InputDecoration(hintText: 'New password'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        obscureText: true,
                        decoration:
                            const InputDecoration(hintText: 'Confirm password'),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 34,
                ),
                SizedBox(
                  width: 277,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('SUBMIT'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
