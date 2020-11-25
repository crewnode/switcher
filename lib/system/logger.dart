import 'definitions.dart' as Config;
// import 'package:http/http.dart' as http;

// Types
const DEBUG_MESSAGE = 0;
const DEBUG_WARNING = 1;
const DEBUG_ERROR = 2;

void debug(String text, [int level = DEBUG_MESSAGE]) {
  if (Config.DEBUG) {
    switch (level) {
      case DEBUG_WARNING:
        {
          print("[WARNING]: " + text);
          // http.post(
          //   [Config.SERVER_URL, Config.ENDPOINT_LOGGER].join("/"),
          //   body: {'log': text, 'severity': 'warning'}
          // );
        }
        break;

      case DEBUG_ERROR:
        {
          print("[ERROR]: " + text);
          // http.post(
          //   [Config.SERVER_URL, Config.ENDPOINT_LOGGER].join("/"),
          //   body: {'log': text, 'severity': 'error'}
          // );
        }
        break;

      case DEBUG_MESSAGE:
      default:
        {
          print("[DEBUG]: " + text);
          // http.post(
          //   [Config.SERVER_URL, Config.ENDPOINT_LOGGER].join("/"),
          //   body: {'log': text, 'severity': 'debug'}
          // );
        }
        break;
    }
  }

  return;
}
