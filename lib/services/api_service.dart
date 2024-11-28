import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class APIService {
  APIService._();
  static final APIService instance = APIService._();
  factory APIService() => instance;

  static const String baseUrl = 'https://5a59-138-199-7-238.ngrok-free.app/api';
  Future<String> sendOtp(String phoneNumber) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/otp/send'),
        body: {'phone_number': "+226$phoneNumber"}, // Ensure using Uri.parse()
      );

      debugPrint("=================STATUS:${response.statusCode}");
      // Check if the request was successful (HTTP 200)
      if (response.statusCode == 200) {
        // Parse the response body
        final Map<String, dynamic> data = json.decode(response.body);
        debugPrint("=================RESPONSE:${response.body}");

        return data['message']; // OTP sent successfully
      } else {
        // Handle unsuccessful connection (non-200 status codes)
        return "failure";
      }
    } catch (e) {
      return "failure";
    }
  }

  Future<String> validateOtp(String phoneNumber, String otp) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/otp/verify'), // Ensure using Uri.parse()
        body: {
          'phone_number': "+226$phoneNumber",
          'otp_code': otp,
        },
      );

      debugPrint("=================STATUT:${response.statusCode}");
      // Check if the request was successful (HTTP 200)
      if (response.statusCode == 200) {
        // Parse the response body
        final Map<String, dynamic> data = json.decode(response.body);
        debugPrint("=================RESPONSE:${response.body}");

        // Check if the OTP is valid
        return data['message']; // OTP valid
      } else {
        // Handle unsuccessful connection (non-200 status codes)
        return "failure";
      }
    } catch (e) {
      return "failure";
    }
  }

  Future<String> validateIDCard(String phoneNumber, String number) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/verify/cnib'), // Ensure using Uri.parse()
        body: {"phone_number": "+226$phoneNumber", 'cnib_number': number},
      );

      // Check if the request was successful (HTTP 200)
      if (response.statusCode == 200) {
        // Parse the response body
        final Map<String, dynamic> data = json.decode(response.body);

        // Check if the id card is valid

        return data['status']; // ID card valid
      } else {
        // Handle unsuccessful connection (non-200 status codes)
        return "failure";
      }
    } catch (e) {
      return "failure";
    }
  }

  Future<String> validateAccountInfo(
      String amount, lastTransactionType, phone) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/verify/transaction'), // Ensure using Uri.parse()
        body: {
          'amount': amount,
          'type': lastTransactionType,
          'phone_number': "+226$phone"
        },
      );
      debugPrint("=================STATUT:${response.statusCode}");
      debugPrint("=================RESPONSE:${response.body}");
      // Check if the request was successful (HTTP 200)
      if (response.statusCode == 200) {
        // Parse the response body
        final Map<String, dynamic> data = json.decode(response.body);

        // Check if the account info is valid

        return data['status']; // account info valid
      } else if (response.statusCode == 403) {
        return "locked";
      } else {
        // Handle unsuccessful connection (non-200 status codes)
        return "failure";
      }
    } catch (e) {
      return "failure"; // Return false in case of an error
    }
  }

  Future<String> resetPin(String newPin, String phone) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/reset-password'),
        body: {
          "new_password": newPin,
          "phone_number": "+226$phone"
        }, // Ensure using Uri.parse()
      );

      // Check if the request was successful (HTTP 200)
      if (response.statusCode == 200) {
        // Parse the response body
        final Map<String, dynamic> data = json.decode(response.body);

        // Check if the reset is successfull

        return data['message'];
      } else {
        // Handle unsuccessful connection (non-200 status codes)
        return "failure";
      }
    } catch (e) {
      return "failure";
    }
  }

  Future<String> sendSelfie(File image) async {
    try {
      final request = http.MultipartRequest(
          'POST', Uri.parse('$baseUrl/clients/upload-selfie'))
        ..files.add(await http.MultipartFile.fromPath(
          'selfie_with_cnib', // Name of the form field in the API
          image.path,
        ));

      final response = await request.send();
      debugPrint("=================STATUT:${response.statusCode}");

      // Check if the request was successful (HTTP 200)
      if (response.statusCode == 200) {
        return "success";
      } else {
        // Handle unsuccessful connection (non-200 status codes)
        return "success";
      }
    } catch (e) {
      throw ServerException("Failed to send OTP");
    }
  }
}

class ServerException implements Exception {
  final String message;

  ServerException(this.message);

  @override
  String toString() => "CustomException: $message";
}
