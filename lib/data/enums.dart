enum TypeKeyPixEnum { PHONE, EMAIL, CPF, RANDOM_KEY, OTHER }

TypeKeyPixEnum typeKeyPixEnum(String value) {
  switch (value) {
    case 'Celular':
      return TypeKeyPixEnum.PHONE;
    case 'E-mail':
      return TypeKeyPixEnum.EMAIL;
    case 'CPF':
      return TypeKeyPixEnum.CPF;
    case 'Chave aleatória':
      return TypeKeyPixEnum.RANDOM_KEY;
    default:
      return TypeKeyPixEnum.OTHER;
  }
}
