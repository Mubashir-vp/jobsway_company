// To parse this JSON data, do
//
//     final paymentResponse = paymentResponseFromJson(jsonString);

import 'dart:convert';

PaymentResponse paymentResponseFromJson(String str) => PaymentResponse.fromJson(json.decode(str));

String paymentResponseToJson(PaymentResponse data) => json.encode(data.toJson());

class PaymentResponse {
    PaymentResponse({
        this.id,
        this.currency,
        this.amount,
    });

    String? id;
    String? currency;
    int? amount;

    factory PaymentResponse.fromJson(Map<String, dynamic> json) => PaymentResponse(
        id: json["id"],
        currency: json["currency"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "currency": currency,
        "amount": amount,
    };
}
