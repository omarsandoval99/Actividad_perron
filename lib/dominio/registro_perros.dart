const String mensajeRegistroError = "Registro de raza incompleto";
const String mensajeCampoVacio = "Sin valor";

class RegistroRaza {
  late final List subraza;
  late final String status;
  RegistroRaza._(this.subraza, this.status);

  factory RegistroRaza.constructor(
      {required List subraza, required String status}) {
    if (subraza == "") {
      throw mensajeCampoVacio;
    }
    if (subraza == null) {
      throw mensajeRegistroError;
    }

    final resultado = RegistroRaza._(subraza, status);

    return resultado;
  }
}
