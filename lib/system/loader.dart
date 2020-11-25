import 'package:global_configuration/global_configuration.dart';
import 'definitions.dart' as Config;
import 'logger.dart' as Logger;
import 'storage.dart';

class Loader {
  Storage _storage;

  Future<bool> initLoad() async {
    // Initialise our storage
    this._initStorage();

    // Load our configuration file
    // TODO: Implement server listing API
    // try {
    //   var serverUrl = [Config.SERVER_URL, Config.ENDPOINT_LISTING].join("/");
    //   Logger.debug("Loading listing: $serverUrl");
    //   await GlobalConfiguration().loadFromUrl(serverUrl);

    //   // Check if it is an erroneous response
    //   if (GlobalConfiguration().get("status") != null &&
    //       GlobalConfiguration().get("status") == "FAIL") {
    //     Logger.debug("Errored!", Logger.DEBUG_ERROR);
    //     return false;
    //   }

    //   // Save a cached version of the loaded URL
    //   this._storage.writeConfig(GlobalConfiguration().appConfig);
    //   Logger.debug("Wrote remote configuration to cache!");
    // } catch (e) {
    //   Logger.debug(e.toString());
    //   Logger.debug("Failed to load from remote URL", Logger.DEBUG_WARNING);
    //   try {
    //     // Load cached configuration
    //     Map<String, dynamic> cached = await this._storage.readConfig();
    //     GlobalConfiguration().loadFromMap(cached);
    //     Logger.debug("Loaded 'cached' asset.");
    //   } catch (e) {
    //     // Load erroneous configuration
    //     Logger.debug(
    //         "Loaded erroneous application due to failed application runtime: no remote, no cache.");
    //     return false;
    //   }
    // }
    return true;
  }

  Storage _initStorage() {
    this._storage = new Storage();
    return this._storage;
  }
}
