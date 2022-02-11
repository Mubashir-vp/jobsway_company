// To parse this JSON data, do
//
//     final getHr = getHrFromJson(jsonString);

import 'dart:convert';

List<GetHr> getHrFromJson(String str) => List<GetHr>.from(json.decode(str).map((x) => GetHr.fromJson(x)));

String getHrToJson(List<GetHr> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetHr {
    GetHr({
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

    factory GetHr.fromJson(Map<String, dynamic> json) => GetHr(
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
