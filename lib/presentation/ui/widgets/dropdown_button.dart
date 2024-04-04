import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdownButton extends StatelessWidget {
  final List<String> items;
  final String? value;
  final String hintText;
  final void Function(String?) onChanged;
  final double height;
  final double width;
  final double dropDownWidth;

  const CustomDropdownButton({
    super.key,
    required this.items,
    required this.onChanged,
    required this.hintText,
    required this.height,
    required this.width,
    required this.dropDownWidth,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonHideUnderline(
        child: Center(
          child: DropdownButton2<String>(
            isExpanded: true,
            hint: Center(
              child: Text(
                hintText,
                style:  TextStyle(
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            items: items.map(
              (String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: SingleChildScrollView(
                    child: Center(
                      child: Text(
                        item,
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.visible,
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
            value: value,
            onChanged: onChanged,
            buttonStyleData: ButtonStyleData(
              height: height,
              width: width,
              padding:  EdgeInsets.only(left: ScreenUtil().setWidth(14), right: ScreenUtil().setWidth(14)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(24)),
                border: Border.all(
                  color: const Color(0x999B9B9B),
                ),
                color: const Color(0xFFF0FFF8),
              ),
              elevation: 2,
            ),
            iconStyleData:  IconStyleData(
              icon: const Icon(
                Icons.arrow_drop_down_rounded,
              ),
              iconSize: ScreenUtil().setSp(30),
              iconEnabledColor: Colors.black,
              iconDisabledColor: Colors.grey,
            ),
            dropdownStyleData: DropdownStyleData(
              maxHeight: 350.h,
              width: dropDownWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(ScreenUtil().setWidth(24)),
                color: const Color(0xFFF0FFF8),
              ),
              offset: const Offset(0, 0),
              scrollbarTheme: ScrollbarThemeData(
                radius:  Radius.circular(ScreenUtil().setWidth(40)),
                thickness: MaterialStateProperty.all(6),
                thumbVisibility: MaterialStateProperty.all(true),
              ),
            ),
            menuItemStyleData: MenuItemStyleData(
              height: 70.h,
              padding: EdgeInsets.only(left: ScreenUtil().setWidth(14), right: ScreenUtil().setWidth(14)),
            ),
          ),
        ),
      ),
    );
  }
}
