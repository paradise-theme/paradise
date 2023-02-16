local wezterm = require("wezterm")

return {
	font = wezterm.font('JetBrains Mono', {weight = 'Regular'}),
	font_size = 10.0,

	enable_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	show_tab_index_in_tab_bar = false,
  window_padding = {
		left = '20pt',
		right = '20pt',
		top = '20pt',
		bottom = '20pt'
	},

  colors = {
    foreground = '#e8e3e3',
    background = '#151515',

    cursor_bg = '#e8e3e3',
    cursor_fg = '#151515',
    cursor_border = '#e8e3e3',

    selection_fg = '#151515',
    selection_bg = '#e8e3e3',

    ansi = {
      '#151515',
      '#B66467',
      '#8C977D',
      '#D9BC8C',
      '#8DA3B9',
      '#A988B0',
      '#8AA6A2',
      '#E8E3E3',
    },
    brights = {
      '#424242',
      '#B66467',
      '#8C977D',
      '#D9BC8C',
      '#8DA3B9',
      '#A988B0',
      '#8AA6A2',
      '#E8E3E3',
    },
  },
}
