import 'dart:io';

class GuideModel {
  // Personal Information
  final String name;
  final String dateOfBirth;
  final String gender;
  final String contactNumber;
  final String emailAddress;
  final String address;

  // Professional Details
  final String yearsOfExperience;
  final List<String> languages;
  final List<String> tourTypes;
  final String areasOfExpertise;

  // Availability
  final String preferredWorkingHours;
  final String daysAvailableForTours;
  final List<String> seasonalAvailability;

  // Profile Photo
  final File? profilePhoto;

  // Constructor
  GuideModel({
    required this.name,
    required this.dateOfBirth,
    required this.gender,
    required this.contactNumber,
    required this.emailAddress,
    required this.address,
    required this.yearsOfExperience,
    required this.languages,
    required this.tourTypes,
    required this.areasOfExpertise,
    required this.preferredWorkingHours,
    required this.daysAvailableForTours,
    required this.seasonalAvailability,
    this.profilePhoto,
  });
}
