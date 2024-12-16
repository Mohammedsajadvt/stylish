class UserModel {
  final String email;
  final String password;
  final String? uid;
  final String? profileImageUrl; 

  UserModel({required this.email,required this.password, this.profileImageUrl,this.uid});
}
