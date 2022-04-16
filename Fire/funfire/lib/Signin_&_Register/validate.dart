class Validates{
   String? validatePassword(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return '*Required field';
    } else {
      if (!regex.hasMatch(value)) {
        return '*Invalid password';
      } else {
        return null;
      }
    }}
    String? conformPassword(String? value,String passKey,String cpassKey) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return '*Required field';
    } else {
      if (!regex.hasMatch(value) || (passKey!=cpassKey)) {
        return '*Invalid password or not matched';
      } else {
        return null;
      }
    }}


    String? validateEmail(String? value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return '*Invalid email!';
                  }
                  return null;
    }
    String? validateName(String? value){
      if(value!.isEmpty){
        return '*Required field';
      }
      else if(value.length<6){
return '*(Name>5) required';
      }
      else{
        return null;
      }
      
    }
    String? validateMobile(String? value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp =  RegExp(pattern);
    if (value!.isEmpty) {
          return '*Required field';
    }
    else if (!regExp.hasMatch(value)) {
      return '*Invalid mobile number';
    }
    else{
    return null;}
}     
        }
