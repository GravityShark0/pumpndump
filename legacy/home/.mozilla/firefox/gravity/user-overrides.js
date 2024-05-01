// /* override recipe: enable session restore ***/
user_pref("browser.startup.page", 3); // 0102
user_pref("browser.privatebrowsing.autostcy_level", 0); // 1003 optional to restore cookies/formdata

// 2810 Disable sanitize on shutdown
user_pref("privacy.sanitize.sanitizeOnShutdown", false);

// 0810 Enable forms and search history
// user_pref( "browser.formfill.enable", true )

// 2811 Enable history
// user_pref("privacy.clearOnShutdown.cache", false);
// user_pref("privacy.clearOnShutdown.downloads", false);
// user_pref("privacy.clearOnShutdown.formdata", false);
// user_pref("privacy.clearOnShutdown.history", false);
// user_pref("privacy.clearOnShutdown.sessions", false);
// user_pref("privacy.clearOnShutdown.siteSettings", false);
// user_pref("privacy.clearOnShutdown.openWindows", false);
