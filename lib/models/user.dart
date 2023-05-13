import 'package:cloud_firestore/cloud_firestore.dart';

class User{
  String firstName = '';
  String lastName ='';
  Timestamp dateOfBirth = Timestamp.now();
  String phoneNumber = '';
  String email = '';

  User.fromJson(userData){
    firstName = userData.firstName;
    lastName= userData.lastName;
    dateOfBirth = Timestamp.fromDate(userData.dateOfBirth);
    phoneNumber = userData.phoneNumber;
    email = userData.email;
  }

  String getFirstName(){
    return firstName;
  }

  String getLastName(){
    return lastName;
  }

  Timestamp getDateOfBirth(){
    return dateOfBirth;
  }

  String getEmail(){
    return email;
  }

  String getPhoneNumber(){
    return phoneNumber;
  }

}