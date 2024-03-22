import 'package:flutter/cupertino.dart';

class TitleAndSubtitle extends StatelessWidget {
  const TitleAndSubtitle({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        children: [
          const SizedBox(
            height: 131,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 47,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          Text(
           subtitle,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
              color: Color(0xFF585858),
            ),
          ),
          const SizedBox(
            height: 53,
          ),
        ],
      ),
    );
  }
}
