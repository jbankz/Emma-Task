class AuthDto {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? address;
  final String? phoneNumber;
  final String? password;
  final String? profileImage;

  AuthDto(
      {this.firstName,
      this.lastName,
      this.email,
      this.address,
      this.phoneNumber,
      this.password,
      this.profileImage});

  Map<String, dynamic> toJson() => <String, dynamic>{
        if (firstName != null) 'firstName': firstName,
        if (lastName != null) 'lastName': lastName,
        if (email != null) 'email': email,
        if (address != null) 'address': address,
        if (phoneNumber != null) 'phoneNumber': phoneNumber,
        if (password != null) 'password': password,
        if (profileImage != null) 'profileImage': profileImage
      };
}
