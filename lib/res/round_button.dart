import 'package:flutter/material.dart';
import 'package:stc_health_suits_assessment_test_nouman/res/colors.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final bool isLoading;
  final Color color;
  final double round;
  final double width;
  final VoidCallback onPress;

  const RoundButton(
      {super.key,
      required this.title,
      required this.width,
      this.isLoading = false,
      required this.onPress,
      required this.color,
      required this.round});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
            color: AppColors.lightBlueColor,
            strokeWidth: 2,
          ))
        : Padding(
            padding: const EdgeInsets.only(left: 0, right: 0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 5.0)
                ],
                color: color,
                borderRadius: BorderRadius.circular(round),
              ),
              child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    minimumSize: MaterialStateProperty.all(Size(width, 50)),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.transparent),
                    // elevation: MaterialStateProperty.all(3),
                    shadowColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                  onPressed: onPress,
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.white),
                  )),
            ),
          );
  }
}
