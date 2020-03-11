const List<String> acceptedCharactersName = [
  'A', 'a','Á','á', 'B', 'b', 'C', 'c', 'D', 'd', 'E', 'e','É','é', 'F', 'f', 'G', 'g', 'H', 'h', 'I', 'i','Í','í', 'J', 'j', 
  'K', 'k', 'L', 'l', 'M', 'm', 'N', 'n', 'O', 'o','Ó','ó', 'P', 'p', 'Q', 'q', 'R', 'r', 'S', 's', 'T', 't', 
  'U', 'u','Ú','ú','ü', 'V', 'v', 'W', 'w', 'X', 'x', 'Y', 'y', 'Z', 'z', ' '
];

bool validarNombre(String name){
  for (int i = 0; i < name.length; i++) {
    if (!acceptedCharactersName.contains(name[i])) {
      return false;
    }
  }
  return true;
}

bool nullName(String name) => !(name.isEmpty || name == null);
