enum Breakpoint{

  xs(
    cod: 1,
    minWidth: 0,
    maxWidth: 575.98,
    abbreviation: 'xs',
    description: 'Extra Small',
  ),
  sm(
    cod: 2,
    maxWidth: 767.98,
    minWidth: 576,
    description: 'Small',
    abbreviation:'sm',
  ),
  md(
    cod: 3,
    maxWidth: 991.98,
    minWidth: 768,
    description: 'Medium',
    abbreviation:'md',
  ),
  lg(
    cod: 4,
    maxWidth: 1199.98,
    minWidth: 992,
    description: 'Large',
    abbreviation: 'lg',
  ),
  xl(
    cod: 5,
    maxWidth: 1399.98,
    minWidth: 1200,
    description: 'Extra large',
    abbreviation: 'xl',
  ),
  xxl(
    cod: 6,
    maxWidth: double.infinity,
    minWidth: 1400,
    description: 'Extra extra large',
    abbreviation: 'xxl',
  );

  const Breakpoint({
    required this.cod,
    required this.maxWidth,
    required this.minWidth,
    required this.description,
    required this.abbreviation,
  });

  final int cod;
  final double maxWidth;
  final double minWidth;
  final String description;
  final String abbreviation;

  static Breakpoint? getByCode(int code) {
    for (var breakpoint in Breakpoint.values) {
      if (breakpoint.cod == code) {
        return breakpoint;
      }
    }
    return null;
  }

}
