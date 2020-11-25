import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:global_configuration/global_configuration.dart';
import 'package:path_provider/path_provider.dart';
import 'logger.dart' as Logger;
import 'definitions.dart' as Logger;

class Storage {
  Storage();

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return new File("$path/cached.json");
  }

  Future<Map> readConfig() async {
    try {
      final file = await _localFile;

      // Read the config file and map out its contents
      String contents = await file.readAsString();
      Map<String, dynamic> configAsMap = json.decode(contents);

      // Check if the configuration file is empty
      if (configAsMap.length == 0) {
        Logger.debug("Unable to read configuration file, content is empty.",
            Logger.DEBUG_ERROR);
        throw new Exception("Invalid configuraton file.");
      }

      return configAsMap;
    } catch (e) {
      // If unable to decode, read from the default asset
      Logger.debug(
          "Unable to read configuration file, loading default asset instead.",
          Logger.DEBUG_ERROR);
      return (await GlobalConfiguration().loadFromAsset("default")).appConfig;
    }
  }

  Future<File> writeConfig(Map<String, dynamic> data) async {
    final file = await _localFile;
    return file.writeAsString(json.encode(data));
  }
}
