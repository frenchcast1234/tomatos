import 'package:flutter/material.dart';
import 'package:tomat_os/core/theme/colors.dart';
import 'package:tomat_os/constants/system_sizes.dart';
import 'package:tomat_os/state/window_state.dart';
import 'package:tomat_os/ui/widgets/os_desk_tab.dart';

class Desks extends StatefulWidget {
  const Desks({super.key});

  @override
  State<Desks> createState() => _DesksState();
}

class _DesksState extends State<Desks> {
  final ScrollController _desksController = ScrollController();

  @override
  void dispose() {
    super.dispose();
    _desksController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: getColor('background-color'),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16.0), bottomRight: Radius.circular(16.0)),
            border: Border(
              bottom: BorderSide(
                color: getColor("divider-color"),
                width: getSizeOf("divider", "width"),
                strokeAlign: BorderSide.strokeAlignOutside
              ),
              left: BorderSide(
                color: getColor("divider-color"),
                width: getSizeOf("divider", "width"),
                strokeAlign: BorderSide.strokeAlignOutside
              ),
              right: BorderSide(
                color: getColor("divider-color"),
                width: getSizeOf("divider", "width"),
                strokeAlign: BorderSide.strokeAlignOutside
              )
            )
          ),
          width: MediaQuery.of(context).size.width,
          height: getSizeOf("desks-header", "height"),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: ScrollbarTheme(
              data: ScrollbarThemeData(
                thumbColor: WidgetStateProperty.all(getColor("text-ui-color").withAlpha(128)),
                // trackColor: WidgetStateProperty.all(getColor("divider-color")),
                thickness: WidgetStateProperty.all(4),
                radius: const Radius.circular(8),
              ),
              child: Scrollbar(
                controller: _desksController,
                thumbVisibility: false,
                scrollbarOrientation: ScrollbarOrientation.bottom,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  controller: _desksController,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      for (int index = 0; index < deskApps.length; index++) ...[
                        DeskTab(
                          name: deskApps[index]["name"] ?? "Bureau",
                          index: index,
                          content: () => Text(
                            deskApps[index]["name"] ?? "Bureau",
                            style: TextStyle(
                              fontSize: 32.0,
                              fontFamily: 'Inter',
                              color: getColor("text-ui-color"),
                              overflow: TextOverflow.ellipsis
                            )
                          ),
                          onDelete: () {
                            setState(() {
                              if (index < deskApps.length) {
                                deskApps.removeAt(index);
                                if (deskApps.isEmpty) {
                                  deskApps.add({
                                    "name": "Desk ${deskApps.length + 1}",
                                    "current": null,
                                    "apps": []
                                  });
                                }
                              }
                            });
                          },
                        ),
                        const SizedBox(width: 15),
                        Container(
                          width: getSizeOf("divider", "width"),
                          height: 64,
                          color: getColor("divider-color"),
                        ),
                        const SizedBox(width: 15),
                      ],
                      DeskTab(
                        padding: EdgeInsets.zero,
                        name: "+",
                        deletable: false,
                        content: () => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: getColor("background-color"),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0)
                            )
                          ),
                          onPressed: () {
                            setState(() {
                              deskApps.add({
                                "name": "Desk ${deskApps.length + 1}",
                                "current": null,
                                "apps": []
                              });
                            });
                          }, 
                          child: Text(
                            '+',
                            style: TextStyle(
                              fontSize: 32.0,
                              fontFamily: 'Inter',
                              color: getColor("text-ui-color"),
                              overflow: TextOverflow.ellipsis
                            )
                          )
                        )
                      )
                    ]
                  )
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}