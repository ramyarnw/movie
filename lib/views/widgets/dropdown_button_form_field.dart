import '../../ui.dart';

class AppDropdownButtonFormField<T> extends StatelessWidget {
  const AppDropdownButtonFormField({
    super.key,
    this.onChanged,
    this.value, this.items,
  });

  final void Function(T?)? onChanged;
  final T? value;
  final List<DropdownMenuItem<T>>? items;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      onChanged: onChanged,
      value: value,
      items: items,
    );
  }
}
