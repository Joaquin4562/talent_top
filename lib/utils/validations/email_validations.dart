const String acceptedDomain = 'itsmante.edu.mx';

const List<String> acceptedCharactersEmail = [
  'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 
   'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 
   'u', 'v', 'w', 'x', 'y', 'z',
   '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '.'
];

const int numberEmailParts = 2;

bool validarEmail(String email, String nc) {
  List<String> emailParts = email.split('@');
  return (validarArroba(emailParts) && validarFormatoEmail(emailParts[0]) && validarDominio(emailParts[1]) && validarEmailNC(email, nc));
}

bool validarFormatoEmail(String email) {
  for (int i = 0; i < email.length; i++) {
    if (!acceptedCharactersEmail.contains(email[i])) {
      return false;
    }
  }
  return true;
}

bool validarEmailNC(String email, String nc) {
  String numNC = nc.replaceAll('01F0', '');
  return email.contains(numNC);
}

bool nullEmail(String email) => !(email.isEmpty || email == null);

bool validarArroba(List<String> emailParts) => (emailParts.length != numberEmailParts) ? false : true;

bool validarDominio(String dominio) => (dominio !=  acceptedDomain) ? false : true;