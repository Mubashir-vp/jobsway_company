// To parse this JSON data, do
//
//     final addJob = addJobFromJson(jsonString);

import 'dart:convert';

AddJob addJobFromJson(String str) => AddJob.fromJson(json.decode(str));

String addJobToJson(AddJob data) => json.encode(data.toJson());

class AddJob {
    AddJob({
        this.job,
    });

    Job? job;

    factory AddJob.fromJson(Map<String, dynamic> json) => AddJob(
        job: Job.fromJson(json["job"]),
    );

    Map<String, dynamic> toJson() => {
        "job": job!.toJson(),
    };
}

class Job {
    Job({
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
    });

    String? id;
    String? jobTitle;
    String? jobCategory;
    String? minExp;
    String? maxExp;
    String? timeSchedule;
    String? minSalary;
      String? jobLocation;

    String? maxSalary;
    List<String>? qualification;
    List<String>? education;
    List<String>? skills;
    List<String>? language;
    bool? status;
    String? companyId;
    String? hrId;
    DateTime? createdDate;
    List<dynamic>? applications;

    factory Job.fromJson(Map<String, dynamic> json) => Job(
        id: json["_id"],
        jobTitle: json["jobTitle"],
        jobCategory: json["jobCategory"],
        minExp: json["minExp"],
        maxExp: json["maxExp"],
        timeSchedule: json["timeSchedule"],
        minSalary: json["minSalary"],
        maxSalary: json["maxSalary"],
        jobLocation: json["jobLocation"],
        qualification: List<String>.from(json["qualification"].map((x) => x)),
        education: List<String>.from(json["education"].map((x) => x)),
        skills: List<String>.from(json["skills"].map((x) => x)),
        language: List<String>.from(json["language"].map((x) => x)),
        status: json["status"],
        companyId: json["companyId"],
        hrId: json["hrId"],
        createdDate: DateTime.parse(json["createdDate"]),
        applications: List<dynamic>.from(json["applications"].map((x) => x)),
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
        "jobLocation":jobLocation,
        "qualification": List<dynamic>.from(qualification!.map((x) => x)),
        "education": List<dynamic>.from(education!.map((x) => x)),
        "skills": List<dynamic>.from(skills!.map((x) => x)),
        "language": List<dynamic>.from(language!.map((x) => x)),
        "status": status,
        "companyId": companyId,
        "hrId": hrId,
        "createdDate": createdDate!.toIso8601String(),
        "applications": List<dynamic>.from(applications!.map((x) => x)),
    };
}
