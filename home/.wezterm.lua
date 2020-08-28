local wezterm = require 'wezterm';
return {
  font = wezterm.font("Fira Code"),
  color_scheme = "Ubuntu",
  font_size = 10.0,
  font_antialias = "Subpixel",
  font_hinting = "Full",
  harfbuzz_features = {"ss01", "ss02", "ss03", "ss04", "ss06", "zero", "onum"},
  send_composed_key_when_alt_is_pressed = false,
  scrollback_lines = 5000,
}
