const String mensajeRegistroError = "Registro de raza incompleto";
const String mensajeCampoVacio = "Sin valor";

class RegistroRaza {
  late final String nombre;

  RegistroRaza._(this.nombre);

  factory RegistroRaza.constructor({
    required String nombre,
  }) {
    if (nombre == "") {
      throw mensajeCampoVacio;
    }
    if (nombre == null) {
      throw mensajeRegistroError;
    }

    nombre = nombre.trim().isEmpty ? mensajeCampoVacio : nombre;
    RegistroRaza._(nombre);
    final resultado = RegistroRaza._(nombre);

    return resultado;
  }
}
