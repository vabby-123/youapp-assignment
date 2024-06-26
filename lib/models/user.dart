class User {
  final String email;
  final String password;
  final String firstName;
  final String lastName;
  final String zodiacSign;

  User({
    required this.email,
    required this.password,
    this.firstName = '',
    this.lastName = '',
    this.zodiacSign = '',
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'],
      password: json['password'],
      firstName: json['profile']['firstName'],
      lastName: json['profile']['lastName'],
      zodiacSign: json['profile']['zodiacSign'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'profile': {
        'firstName': firstName,
        'lastName': lastName,
        'zodiacSign': zodiacSign,
      },
    };
  }
}
