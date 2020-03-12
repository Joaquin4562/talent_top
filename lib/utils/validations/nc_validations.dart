
const String acceptedFormatNC = '01F0';
const int ncLength = 9;

bool validarLongNC(String nc) => (nc.length != ncLength) ? false : true;
  
bool validarFormatoMedioNC(String nc) => (nc != acceptedFormatNC) ? false : true;
  
bool validarFormatoInicialFinalNC(String nc) {
  try {
    int.parse(nc);
    return true;
  } catch (FormatException) {
    return false;
  }
}

bool validarFormatoNC(String nc) {
  if(validarFormatoInicialFinalNC(nc.substring(0, 2)) && validarFormatoMedioNC(nc.substring(2, 6)) && validarFormatoInicialFinalNC(nc.substring(6, 9))) {
    return true;
  } else {
    return false;
  }
}
