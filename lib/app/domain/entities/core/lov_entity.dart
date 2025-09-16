class LovEntity{

  //Os campos que serão exibidos no lov card
  Map<String, String> dataList;

  //O valor retornado no onSelected
  dynamic value;

  //O texto que será exibido no campo de texto que abre o modal deposi de uma opçao ser selecionada
  String fieldText;

  LovEntity({required this.dataList, required this.value, required this.fieldText});

}