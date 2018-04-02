*font: xft:FiraMono:size=10

URxvt*.background: {% if transparency %}[{{ transparency }}]{% endif %}{{ black }}
URxvt*.foreground: {{ white }}
*.cursorColor: {{ white }}

URxvt.depth: 32
URxvt.scrollBar: false
URxvt*dynamicColors:on
URxvt.iso14755: off
! black
*.color0: {{ black }}
*.color8: {{ alt_black }}
! red
*.color1: {{ red }}
*.color9: {{ alt_red }}
! green
*.color2: {{ green }}
*.color10: {{ alt_green }}
! yellow
*.color3: {{ yellow }}
*.color11: {{ alt_yellow }}
! blue
*.color4: {{ blue }}
*.color12: {{ alt_blue }}
! magenta
*.color5: {{ magenta }}
*.color13: {{ alt_magenta }}
! cyan
*.color6: {{ cyan }}
*.color14: {{ alt_cyan }}
! white
*.color7: {{ white }}
*.color15: {{ alt_white }}
! underline when default
*.colorUL: {% if underline %}{{ underline }}{% else %}{{ white }}{% endif %}

!rofi configuration
rofi.lines: 		6
rofi.show: 		run
rofi.font:FiraMono 12
!State:				background	foreground	bgaltrow	fgselected	bgselected
rofi.color-normal:	#00000000,	#eb4422,	#00000000,	#973108,	#000000
rofi.color-urgent:	#101010,	#eb4422,	#00000000,	#90973108,	#4a4a4a
rofi.color-active:	#101010,	#eb4422,	#00000000,	#90973108,	#4a4a4a
rofi.color-window:	#D0000000,	#D0000000
rofi.hide-scrollbar:	true
rofi.fullscreen:	true
rofi.line-margin:	10
rofi.padding:		200
!show on currently focused monitor
rofi.monitor:		-1
rofi.no-levenshtein-sort:	true
rofi.terminal: urxvtc
