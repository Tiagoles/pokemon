enum FilterMenuDropdownOption{

  todas('Todas'),
  retornando('Retornando'),
  efetivando('Efetivando'),
  iniciadas('Iniciadas');

  final String title;

  const FilterMenuDropdownOption(this.title);

  static FilterMenuDropdownOption fromName(String name){
    return values.firstWhere((option) => option.name == name, orElse: () => FilterMenuDropdownOption.todas);
  }

}