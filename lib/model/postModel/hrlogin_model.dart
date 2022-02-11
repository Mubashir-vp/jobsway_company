// To parse this JSON data, do
//
//     final hrLogin = hrLoginFromJson(jsonString);

import 'dart:convert';

HrLogin hrLoginFromJson(String str) => HrLogin.fromJson(json.decode(str));

String hrLoginToJson(HrLogin data) => json.encode(data.toJson());

class HrLogin {
    HrLogin({
        this.hrDetails,
        this.token,
    });

    HrDetails? hrDetails;
    String? token;

    factory HrLogin.fromJson(Map<String, dynamic> json) => HrLogin(
        hrDetails: HrDetails.fromJson(json["hrDetails"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "hrDetails": hrDetails!.toJson(),
        "token": token,
    };
}

class HrDetails {
    HrDetails({
        this.id,
        this.email,
        this.name,
        this.companyId,
        this.password,
        this.status,
    });

    String? id;
    String? email;
    String? name;
    String? companyId;
    String? password;
    String? status;

    factory HrDetails.fromJson(Map<String, dynamic> json) => HrDetails(
        id: json["_id"],
        email: json["email"],
        name: json["name"],
        companyId: json["companyId"],
        password: json["password"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "name": name,
        "companyId": companyId,
        "password": password,
        "status": status,
    };
}
