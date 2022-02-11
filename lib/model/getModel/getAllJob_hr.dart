// To parse this JSON data, do
//
//     final getAllJobHr = getAllJobHrFromJson(jsonString);

import 'dart:convert';

List<GetAllJobHr> getAllJobHrFromJson(String str) => List<GetAllJobHr>.from(json.decode(str).map((x) => GetAllJobHr.fromJson(x)));

String getAllJobHrToJson(List<GetAllJobHr> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetAllJobHr {
    GetAllJobHr({
        this.id,
        this.jobTitle,
        this.jobCategory,
        this.minExp,
        this.maxExp,
        this.timeSchedule,
        this.minSalary,
        this.maxSalary,
        this.qualification,
        this.education,
        this.jobLocation,
        this.skills,
        this.language,
        this.status,
        this.companyId,
        this.hrId,
        this.createdDate,
        this.applications,
        this.payPlan,
        this.companyDetails,
    });

    String? id;
    String? jobTitle;
    String? jobCategory;
    String? minExp;
    String? maxExp;
    String? timeSchedule;
    String? minSalary;
    String? maxSalary;
    List<String> ?qualification;
    List<String> ?education;
    String? jobLocation;
    List<String> ?skills;
    List<String> ?language;
    bool ?status;
    String ?companyId;
    String? hrId;
    DateTime ?createdDate;
    List<dynamic>? applications;
    String ?payPlan;
    List<CompanyDetail> ?companyDetails;

    factory GetAllJobHr.fromJson(Map<String, dynamic> json) => GetAllJobHr(
        id: json["_id"],
        jobTitle: json["jobTitle"],
        jobCategory: json["jobCategory"],
        minExp: json["minExp"],
        maxExp: json["maxExp"],
        timeSchedule: json["timeSchedule"],
        minSalary: json["minSalary"],
        maxSalary: json["maxSalary"],
        qualification: List<String>.from(json["qualification"].map((x) => x)),
        education: List<String>.from(json["education"].map((x) => x)),
        jobLocation: json["jobLocation"],
        skills: List<String>.from(json["skills"].map((x) => x)),
        language: List<String>.from(json["language"].map((x) => x)),
        status: json["status"],
        companyId: json["companyId"],
        hrId: json["hrId"],
        createdDate: DateTime.parse(json["createdDate"]),
        applications: List<dynamic>.from(json["applications"].map((x) => x)),
        payPlan: json["payPlan"],
        companyDetails: List<CompanyDetail>.from(json["companyDetails"].map((x) => CompanyDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "jobTitle": jobTitle,
        "jobCategory": jobCategory,
        "minExp": minExp,
        "maxExp": maxExp,
        "timeSchedule": timeSchedule,
        "minSalary": minSalary,
        "maxSalary": maxSalary,
        "qualification": List<dynamic>.from(qualification!.map((x) => x)),
        "education": List<dynamic>.from(education!.map((x) => x)),
        "jobLocation": jobLocation,
        "skills": List<dynamic>.from(skills!.map((x) => x)),
        "language": List<dynamic>.from(language!.map((x) => x)),
        "status": status,
        "companyId": companyId,
        "hrId": hrId,
        "createdDate": createdDate!.toIso8601String(),
        "applications": List<dynamic>.from(applications!.map((x) => x)),
        "payPlan": payPlan,
        "companyDetails": List<dynamic>.from(companyDetails!.map((x) => x.toJson())),
    };
}

class CompanyDetail {
    CompanyDetail({
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

    String ?id;
    String ?companyName;
    String ?industry;
    String ?location;
    String ?email;
    String ?bio;
    String ?phone;
    String ?website;
    String ?linkedin;
    String ?facebook;
    String ?instagram;
    String ?password;
    String? logoUrl;
    bool? status;
    bool? ban;

    factory CompanyDetail.fromJson(Map<String, dynamic> json) => CompanyDetail(
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
