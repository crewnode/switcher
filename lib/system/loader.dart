import 'storage.dart';

class CrewNodeHandler {
  // Make this class a singleton
  static final CrewNodeHandler _singleton = CrewNodeHandler._internal();
  factory CrewNodeHandler() {
    return _singleton;
  }
  CrewNodeHandler._internal();

  // Handlers
  Storage _storage;

  // Initialisers
  Future<bool> initLoad() async {
    // Initialise our storage
    this._initStorage(resetConfig: false);
    this._storage.readConfig();

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

  Storage _initStorage({bool resetConfig = false}) {
    this._storage = new Storage();

    // Check if we're resetting the configuration file
    if (resetConfig) {
      this._storage.resetConfig();
    }

    return this._storage;
  }

  // Getters
  Storage getStorage() {
    return this._storage;
  }

  Future<Map<String, dynamic>> getConfig() async {
    Map<String, dynamic> conf = await this._storage.readConfig();
    return conf;
  }
}
