import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobswaycompany/constants/constants.dart';

enum Time { FullTime, Parttime }
Time? _character = Time.FullTime;

class addnewJobController extends GetxController {
  int count = 1;
  int cardCount = 1;
  addButton() {
    return IconButton(
      onPressed: () {
        count = count + 1;
        update();
      },
      icon: const Icon(
        Icons.add,
      ),
    );
  }

  cardButton() {
    return IconButton(
      onPressed: () {
        cardCount = cardCount + 1;
        update();
      },
      icon: const Icon(
        Icons.add,
      ),
    );
  }

  radioButton() {
    return Column(
      children: [
        ListTile(
          title: const Text('Fulltime',),
          leading: Radio<Time>(
                        activeColor: primaryGreen,

            value: Time.FullTime,
            groupValue: _character,
            onChanged: (
              Time? value,
            ) {
              _character = value;
              update();
            },
          ),
        ),
        ListTile(
          title: const Text(
            'Part Time',
          ),
          leading: Radio<Time>(
            activeColor: primaryGreen,
            value: Time.Parttime,
            groupValue: _character,
            onChanged: (
              Time? value,
            ) {
              update();
              _character = value;
            },
          ),
        ),
      ],
    );
  }
}
