import 'package:flutter/material.dart';
import 'package:tecudiahotelbookingapp/models/iconbox.dart';

class BoxWidget extends StatelessWidget {
  final BoxData data;
  final bool isSelected;

  final Function() onTap;

  const BoxWidget(
      {required this.data, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 80,
          decoration: BoxDecoration(
            color:
                isSelected ? Color.fromARGB(255, 97, 180, 249) : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(data.icon, size: 40),
              const SizedBox(height: 10),
              Text(
                data.text,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
