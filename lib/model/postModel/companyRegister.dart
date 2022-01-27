import 'package:flutter/material.dart';

class CompanyRegisterModel {
  CompanyRegisterModel({
    required this.companyName,
    required this.industrie,
    required this.email,
    required this.phone,
    required this.aboutCompany,
    required this.image,
    this.website,
    this.facebook,
    this.instagram,
    this.linkedIn,
    required this.location,
    required this.password,
  });
  String companyName;
  String industrie;
  String location;
  String email;
  String phone;
  String aboutCompany;
  Image image;
  String? website;
  String? linkedIn;
  String? facebook;
  String? instagram;
  String password;
}
