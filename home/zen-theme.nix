{ pkgs, ... }:

let
  zenThemeSync = pkgs.writeShellScriptBin "zen-theme-sync" ''
    set -eu

    generated="$HOME/.local/state/caelestia/theme/zen.css"
    [ -f "$generated" ] || exit 0
    [ -d "$HOME/.zen" ] || exit 0

    find "$HOME/.zen" -mindepth 1 -maxdepth 1 -type d | while read -r profile; do
      [ -f "$profile/prefs.js" ] || continue

      mkdir -p "$profile/chrome"
      cp "$generated" "$profile/chrome/caelestia.css"

      userchrome="$profile/chrome/userChrome.css"
      touch "$userchrome"
      if ! grep -q 'caelestia.css' "$userchrome"; then
        printf '%s\n' '@import url("caelestia.css");' >> "$userchrome"
      fi

      userjs="$profile/user.js"
      touch "$userjs"
      if ! grep -q 'toolkit.legacyUserProfileCustomizations.stylesheets' "$userjs"; then
        printf '%s\n' 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' >> "$userjs"
      fi
    done
  '';
in
{
  home.packages = [ zenThemeSync ];

  xdg.configFile."caelestia/templates/zen.css".text = ''
    :root {
      --zen-primary-color: {{ primary.hex }} !important;
      --zen-colors-primary: {{ primary.hex }} !important;
      --zen-colors-secondary: {{ secondary.hex }} !important;
      --zen-colors-tertiary: {{ tertiary.hex }} !important;
      --zen-colors-border: {{ outline.hex }} !important;

      --toolbar-bgcolor: {{ surface.hex }} !important;
      --toolbar-color: {{ onSurface.hex }} !important;
      --lwt-accent-color: {{ surface.hex }} !important;
      --lwt-text-color: {{ onSurface.hex }} !important;
      --sidebar-background-color: {{ surfaceContainer.hex }} !important;
      --sidebar-text-color: {{ onSurface.hex }} !important;
    }

    #navigator-toolbox,
    #TabsToolbar,
    #nav-bar,
    #PersonalToolbar,
    #sidebar-box {
      background-color: {{ surface.hex }} !important;
      color: {{ onSurface.hex }} !important;
    }

    .tab-background[selected="true"],
    #urlbar-background {
      background-color: {{ surfaceContainerHigh.hex }} !important;
    }

    #urlbar[focused="true"] > #urlbar-background {
      outline: 1px solid {{ primary.hex }} !important;
    }
  '';
}
