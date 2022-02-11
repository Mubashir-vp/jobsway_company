// To parse this JSON data, do
//
//     final hrcreation = hrcreationFromJson(jsonString);

import 'dart:convert';

Hrcreation hrcreationFromJson(String str) => Hrcreation.fromJson(json.decode(str));

String hrcreationToJson(Hrcreation data) => json.encode(data.toJson());

class Hrcreation {
    Hrcreation({
        this.hr,
        this.signLink,
    });

    Hr? hr;
    String? signLink;

    factory Hrcreation.fromJson(Map<String, dynamic> json) => Hrcreation(
        hr: Hr.fromJson(json["hr"]),
        signLink: json["signLink"],
    );

    Map<String, dynamic> toJson() => {
        "hr": hr!.toJson(),
        "signLink": signLink,
    };
}

class Hr {
    Hr({
        this.id,
        this.email,
        this.name,
        this.companyId,
        this.status,
    });

    String? id;
    String? email;
    String? name;
    String? companyId;
    String? status;

    factory Hr.fromJson(Map<String, dynamic> json) => Hr(
        id: json["_id"],
        email: json["email"],
        name: json["name"],
        companyId: json["companyId"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "email": email,
        "name": name,
        "companyId": companyId,
        "status": status,
    };
}
