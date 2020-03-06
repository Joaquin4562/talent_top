
const List<String> acceptedCharactersPassword = [
  'A', 'a', 'B', 'b', 'C', 'c', 'D', 'd', 'E', 'e', 'F', 'f', 'G', 'g', 'H', 'h', 'I', 'i', 'J', 'j', 
  'K', 'k', 'L', 'l', 'M', 'm', 'N', 'n', 'O', 'o', 'P', 'p', 'Q', 'q', 'R', 'r', 'S', 's', 'T', 't', 
  'U', 'u', 'V', 'v', 'W', 'w', 'X', 'x', 'Y', 'y', 'Z', 'z',
  '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
];

const List<String> numbers = [
  '0', '1', '2', '3', '4', '5', '6', '7', '8', '9'
];

const int minPasswordLength = 8;
const int minUpperCaseLetters = 1;
const int minLowerCaseLetters = 1;
const int minNumbers = 1;

bool validarMayusMinusNumsContrasena(String password) {
  int upperCount = 0;
  int lowerCount = 0;
  int nums       = 0;
  for (int i = 0; i < password.length; i++) {
    if (password[i] == password[i].toUpperCase() && !numbers.contains(password[i])) {
      upperCount++;
    } else if (numbers.contains(password[i])) {
      nums++;
    } else {
      lowerCount++;
    }
  }
  if (upperCount < minUpperCaseLetters || lowerCount < minLowerCaseLetters || nums < minNumbers) {
    return false;
  }
  return true;
}

bool validarFormatoContrasena(String password) {
  for (int i = 0; i < password.length; i++) {
    if (!acceptedCharactersPassword.contains(password[i])) {
      return false;
    }
  }
  return true;
}

bool validarLongContrasena(String password) => !(password.length < minPasswordLength);
