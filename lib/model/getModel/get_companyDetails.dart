// To parse this JSON data, do
//
//     final companyDetailsHr = companyDetailsHrFromJson(jsonString);

import 'dart:convert';

CompanyDetailsHr companyDetailsHrFromJson(String str) => CompanyDetailsHr.fromJson(json.decode(str));

String companyDetailsHrToJson(CompanyDetailsHr data) => json.encode(data.toJson());

class CompanyDetailsHr {
    CompanyDetailsHr({
        this.company,
    });

    Company? company;

    factory CompanyDetailsHr.fromJson(Map<String, dynamic> json) => CompanyDetailsHr(
        company: Company.fromJson(json["company"]),
    );

    Map<String, dynamic> toJson() => {
        "company": company!.toJson(),
    };
}

class Company {
    Company({
        this.id,
        this.companyName,
        this.industry,
        this.location,
        this.email,
        this.bio,
        this.phone,
        this.website,
        this.linkedin,
        this.facebook,
        this.instagram,
        this.password,
        this.logoUrl,
        this.status,
        this.ban,
    });

    String? id;
    String? companyName;
    String? industry;
    String? location;
    String? email;
    String? bio;
    String? phone;
    String? website;
    String? linkedin;
    String? facebook;
    String? instagram;
    String? password;
    String? logoUrl;
    bool? status;
    bool? ban;

    factory Company.fromJson(Map<String, dynamic> json) => Company(
        id: json["_id"],
        companyName: json["companyName"],
        industry: json["industry"],
        location: json["location"],
        email: json["email"],
        bio: json["bio"],
        phone: json["phone"],
        website: json["website"],
        linkedin: json["linkedin"],
        facebook: json["facebook"],
        instagram: json["instagram"],
        password: json["password"],
        logoUrl: json["logoUrl"],
        status: json["status"],
        ban: json["ban"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "companyName": companyName,
        "industry": industry,
        "location": location,
        "email": email,
        "bio": bio,
        "phone": phone,
        "website": website,
        "linkedin": linkedin,
        "facebook": facebook,
        "instagram": instagram,
        "password": password,
        "logoUrl": logoUrl,
        "status": status,
        "ban": ban,
    };
}
