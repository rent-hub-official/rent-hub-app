import 'package:flutter/material.dart';

class MainBtnWidget extends StatelessWidget {
  final Function() onTap;
  final String btnTxt;

  const MainBtnWidget({
    super.key,
    required this.onTap,
    required this.btnTxt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            ),
            child: Text(
              btnTxt,
              style: const TextStyle(
                  color: Colors.white, fontSize: Checkbox.width),
            ),
          ),
        ),
      ),
    );
  }
}
