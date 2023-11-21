import 'package:flutter/material.dart';
import 'package:my_first_get_x/constants/app_colors.dart';

class CheckBoxView extends StatefulWidget {
  const CheckBoxView({super.key});

  @override
  State<CheckBoxView> createState() => _CheckBoxViewState();
}

class _CheckBoxViewState extends State<CheckBoxView> {
  bool? tile1 = true;
  bool? tile2 = true;
  bool? tile3 = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Visibility(
                  visible: tile1!,
                  child: Container(
                    color: AppColors.blue,
                    height: 100,
                    width: 100,
                  ),
                ),
                Visibility(
                  visible: tile2!,
                  child: Container(
                    color: AppColors.blue,
                    height: 100,
                    width: 100,
                  ),
                ),
                Visibility(
                  visible: tile3!,
                  child: Container(
                    color: AppColors.blue,
                    height: 100,
                    width: 100,
                  ),
                )
              ],
            ),
            CheckboxListTile(
                value: tile1,
                onChanged: (value) {
                  tile1 = value;
                  setState(() {});
                }),
            CheckboxListTile(
                value: tile2,
                onChanged: (value) {
                  tile2 = value;
                  setState(() {});
                }),
            CheckboxListTile(
                value: tile3,
                onChanged: (value) {
                  tile3 = value;
                  setState(() {});
                }),
            TextButton(
                onPressed: () {
                  tile1 = true;
                  tile2 = true;
                  tile3 = true;
                  setState(() {});
                },
                child: Text('All Clear'))
          ]),
        ),
      ),
    );
  }
}
