import 'package:tomat_os/ui/windows/window.dart';
import 'package:tomat_os/state/window_state.dart';

void addWindow(String url) {
  WIndow window = WIndow(url: url);
  deskApps[deskIdx]["apps"].add(window);
  deskApps[deskIdx]["current"] = deskApps[deskIdx]["apps"].length - 1;
  notifyWindowChange(); // 👈 c'était juste ça qui manquait
}