import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  final TextEditingController controller;
  final double height;
  final double width;
  final ValueChanged<String>? onChanged; // Added onChanged callback

  const CustomDatePicker({
    super.key,
    required this.controller,
    required this.height,
    required this.width,
    this.onChanged, // Optional onChanged callback
  });

  @override
  CustomDatePickerState createState() => CustomDatePickerState();
}

class CustomDatePickerState extends State<CustomDatePicker> {
  @override
  void initState() {
    super.initState();
    widget.controller.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Material(
        elevation: 3,
        borderRadius: BorderRadius.circular(24),
        child: TextField(
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: "Select Date",
            hintStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 14),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: const BorderSide(
                color: Color(0x999B9B9B),
              ),
            ),
            filled: true,
            fillColor: const Color(0xFFF0FFF8),
          ),
          readOnly: true,
          onTap: () async {
            final ThemeData datePickerTheme = ThemeData(
              colorScheme: const ColorScheme.light(primary: Colors.blue),
            );

            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2024),
              lastDate: DateTime(2100),
              builder: (BuildContext context, Widget? child) {
                return Theme(data: datePickerTheme, child: child!);
              },
            );

            if (pickedDate != null) {
              String formattedDate =
                  DateFormat('dd-MM-yyyy').format(pickedDate);
              setState(
                () {
                  widget.controller.text = formattedDate;
                  // Call onChanged callback if provided
                  if (widget.onChanged != null) {
                    widget.onChanged!(formattedDate);
                  }
                },
              );
            }
          },
        ),
      ),
    );
  }
}
