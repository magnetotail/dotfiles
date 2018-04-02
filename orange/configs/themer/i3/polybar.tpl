[colors]
background = {{ black }}
foreground = {{ white }}
primary = {{ primary }}
secondary = {{ secondary }}
tertiary = {{ tertiary }}
warning = {{ special }}
;colors for modules
color0 = {{ alt_black }}
color1 = {{ red }}
color2 = {{ alt_red }}
color3 = {{ green }}
color4 = {{ alt_green }}
color5 = {{ yellow }}
color6 = {{ alt_yellow }}
color7 = {{ blue }}
color8 = {{ alt_blue }}
color9 = {{ magenta }}
color10 = {{ alt_magenta }}
color11 = {{ cyan }}
color12 = {{ alt_cyan }}
color13 = {{ alt_white }}

[fonts]
fontmain = "xft:FiraMono:size=12"
fontsizemain = "12;3"
fonticon = "FontAwesome"
fontsizeicon = "6;3"

[bar/main]
bottom = false
fixed-center = true
monitor = LVDS-1
width = 100%
height = 12
radius = 0.0
module-margin = 0
padding-left = 1

line-size = 2

background = ${colors.background}
foreground = ${colors.foreground}

font-0 = FiraMono:size=8;2
font-1 = FontAwesome:size=9;3

modules-left = i3 updates bat
modules-center = cpu date memory
modules-right = network netspeed filesystem pavolume

separator = 

tray-position = right
;shift contents when tray changes
tray-detached = false
tray-background = ${colors.color13}
tray-foreground = ${colors.background}
tray-offset-x = 0
tray-offset-y = 0
tray-padding = 0
tray-scale = 1.0

enable-ipc = false

;Fallback click handlers
click-left =
click-middle =
click-right =
scroll-up =
scroll-down =
double-click-left =
double-click-middle =
double-click-right =

[module/i3]
type = internal/i3
ws-icon-0 = 1;
ws-icon-1 = 2;dev
ws-icon-2 = 3;
ws-icon-3 = 4;
ws-icon-4 = 5;
ws-icon-5 = 6;5
ws-icon-6 = 7;6
ws-icon-7 = 8;7
ws-icon-8 = 9;
ws-icon-9 = 10;

strip-wsnumbers = true

index-sort = true

enable-click = true
enable-scroll = false
wrapping-scroll = false
reverse-scroll = false

fuzzy-match = false

format = <label-state><label-mode>

label-active = %token%

label-focused = %icon%
label-focused-foreground = ${colors.background}
label-focused-background = ${colors.foreground}
;label-focused-underline = ${colors.secondary}
label-focused-padding = 1

label-unfocused = %icon%
label-unfocused-foreground = ${colors.foreground}
label-unfocused-background = ${colors.background}
;label-unfocused-underline = ${colors.primary}
label-unfocused-padding = 1

label-visible = %icon%
label-visible-foreground = ${colors.foreground}
label-visible-background = ${colors.background}
;label-visible-underline = ${colors.primary}
label-visible-padding = 1

label-urgent = %icon%
label-urgent-foreground = ${colors.background}
label-urgent-background = ${colors.warning}
;label-urgent-underline = ${colors.tertiary}
label-urgent-padding = 1

label-mode-foreground = ${colors.background}
label-mode-background = ${colors.color10}
label-mode-padding = 1

[module/cpu]
type = internal/cpu

border-size = 2
border-color = ${colors.foreground}

;line-size = 2
;line-color = ${colors.foreground}

interval = 1.0

format = <label>

label ="%percentage:3%%"
label-foreground = ${colors.background}
label-background = ${colors.color0}
;label-underline = ${colors.tertiary}

label-padding = 1

[module/filesystem]
type = internal/fs
mount-0 = /
interval = 30

spacing = 0
format-mounted = <label-mounted> 

format-unmounted = <label-unmounted>

;format-mounted-prefix =  
;format-mounted-prefix-background = ${colors.color1}
;format-mounted-prefix-foreground = ${colors.background}
label-mounted =  %free%
label-mounted-padding = 1

;label-mounted-underline = ${colors.tertiary}
label-mounted-foreground = ${colors.background}
label-mounted-background = ${colors.color1}

[module/memory]
type = internal/memory

; Seconds to sleep between updates
; Default: 1
interval = 1

Additional formatting

; Available tags:
;   <label> (default)
;   <bar-used>
;   <bar-free>
format = <label>

; Available tokens:
;   %percentage_used% (default)
;   %percentage_free%
;   %gb_used%
;   %gb_free%
;   %gb_total%
;   %mb_used%
;   %mb_free%
;   %mb_total%
label =  %percentage_used%%

label-foreground = ${colors.background}
label-background = ${colors.color2}

label-padding = 1

click-left = exec 'urxvt -e top'

[module/date]
type = internal/date

interval = 1.0

date = %Y-%m-%d

time = %H:%M:%S

label = %date%  %time%

label-foreground = ${colors.background}
label-background = ${colors.color3}
label-connected-padding = 1
label-padding = 1
[module/netspeed]
type = internal/network
interface = wlp3s0
interval = 1
label-connected-padding = 1
label-connected = " %upspeed:8% %downspeed:8%"
label-connected-background = ${colors.color7}
label-connected-foreground = ${colors.background}

[module/network]
type = internal/network
interface = wlp3s0
interval = 1.0
ping-interval = 3

format-connected = <label-connected>

label-connected =" %local_ip%"
label-connected-foreground = ${colors.background}
label-connected-background = ${colors.color5}
label-connected-padding = 1

format-disconnected = <label-disconnected>

label-disconnected = KEIN WLAN
label-disconnected-foreground =  ${colors.background}
label-disconnected-background = #FF0000
label-disconnected-padding = 1


format-packetloss = <animation-packetloss><label-connected>

animation-packetloss-0 = 
animation-packetloss-0-foreground = ${colors.background}
animation-packetloss-0-background = #FF0000
animation-packetloss-1 = 
animation-packetloss-1-foreground = #FF0000
animation-packetloss-1-background = ${colors.background}
animation-packetloss-framerate = 500


[module/pavolume]
type = custom/script
interval = 1
label = %output:0:4%
exec = ~/.config/scripts/pavolume.sh
click-right = exec pavucontrol
click-left = ~/.config/scripts/pavolume.sh --togmute
scroll-up = ~/.config/scripts/pavolume.sh --up
scroll-down = ~/.config/scripts/pavolume.sh --down

label-foreground = ${colors.background}
label-background = ${colors.color6}
label-padding = 1

[module/bat]
type=internal/battery

battery = BAT0
adapter = AC
poll-interval = 1

time-format = %H:%M

label-charging-background=${colors.color8}
label-discharging-background=${colors.color8}
label-full-background=${colors.color8}
label-charging-foreground=${colors.background}
label-discharging-foreground=${colors.background}
label-full-foreground=${colors.background}
label-full-padding = 1
label-charging-padding = 1
label-discharging-padding = 1
label-charging = " CHR%percentage:3%%"
label-full = " FULL"
label-discharging = " BAT%percentage:3%% %time%"

[module/mpdtom]
type = internal/mpd

host=192.168.3.53
port = 6600
label-song-foreground = ${colors.background}
label-song-background = ${colors.color9}
label-song-maxlen = 30
label-song-ellipsis = false
[module/mpdras]
type = internal/mpd

host=192.168.0.18
port = 6600
label-song-foreground = ${colors.background}
label-song-background = ${colors.color9}
label-song-maxlen = 30
interval = 1
label-song-ellipsis = false

[module/updates]
type = custom/script

exec = /home/selphie/.config/scripts/updatenum.sh
interval = 600

label = " %output:0:5%"
label-foreground = ${colors.background}
label-background = ${colors.color10}
label-padding = 1

format-prefix = "  "
format-prefix-background = ${colors.background}

