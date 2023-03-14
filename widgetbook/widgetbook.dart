import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

class WidgetBook extends StatelessWidget {
  const WidgetBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      categories: [
        WidgetbookCategory(
          name: 'Texts',
          widgets: [
            WidgetbookComponent(
              name: 'Text1',
              useCases: [
                _textUseCase(),
              ],
            ),
          ],
        ),
      ],
      themes: [
        WidgetbookTheme(
          name: "Light",
          data: ThemeData(
            colorScheme: const ColorScheme.dark(
              brightness: Brightness.light,
              primary: Colors.deepPurple,
              secondary: Colors.brown,
            ),
          ),
        ),
        WidgetbookTheme(
          name: "Dark",
          data: ThemeData(
            colorScheme: const ColorScheme.dark(
              brightness: Brightness.dark,
              primary: Colors.greenAccent,
              secondary: Colors.yellowAccent,
            ),
          ),
        ),
      ],
      appInfo: AppInfo(name: "WidgetBook Themes Sample"),
    );
  }

  WidgetbookUseCase _textUseCase() {
    return WidgetbookUseCase(
      name: 'TextDS',
      builder: (context) {
        var primary = Theme.of(context).colorScheme.primary;
        var secondary = Theme.of(context).colorScheme.secondary;
        var color = context.knobs.options<Color?>(
          label: "Colors",
          options: [
            Option(
              label: "primary",
              value: primary
            ),
            Option(
              label: "secondary",
              value: secondary
            ),
          ],
        );
        return Center(
          child: Text(
            "Text Use Case",
            style: TextStyle(
              color: color,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
