# This file has been auto-generated by i3-config-wizard(1).
# It will not be overwritten, so edit it as you like.
#
# Should you change your keyboard layout some time, delete
# this file and re-run i3-config-wizard(1).
#

# i3 config file (v4)
#
# Please see http://i3wm.org/docs/userguide.html for a complete reference!

set $mod Mod4

new_window pixel 1
# colors
set $background {{ black }}
set $foreground {{ white }}
set $gray       {{ alt_black }}
set $primary    {{ primary }}
set $secondary  {{ secondary }}
set $tertiary   {{ tertiary }}
set $warning    {{ special }}
#

mouse_warping none

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
#font pango:monospace 9

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
font pango:DejaVu Sans Mono 8

# Before i3 v4.8, we used to recommend this one as the default:
# font -misc-fixed-medium-r-normal--13-120-75-75-C-70-iso10646-1
# The font above is very space-efficient, that is, it looks good, sharp and
# clear in small sizes. However, its unicode glyph coverage is limited, the old
# X core fonts rendering does not support right-to-left and this being a bitmap
# font, it doesn’t scale on retina/hidpi displays.

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start a terminal
bindsym $mod+Return exec urxvtc

# kill focused window
bindsym $mod+Shift+q kill
bindsym $mod+q kill
#bind rofi to mod + d
#bindsym $mod+d exec dmenu_run
bindsym $mod+d exec rofi -show run

bindsym F1 nop

# change focus
bindsym $mod+h focus left
bindsym $mod+k focus down
bindsym $mod+j focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+h move left
bindsym $mod+Shift+k move down
bindsym $mod+Shift+j move up
bindsym $mod+Shift+l move right

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+u split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+s layout stacking
bindsym $mod+w layout tabbed
bindsym $mod+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

set $terminal "1"
set $dev "2"
set $web "3"
set $workspace4 "4"
set $workspace5 "5"
set $workspace6 "6"
set $workspace7 "7"
set $workspace8 "8"
set $spotify  "9"
set $workspace10 "10"


#workspace $terminal
#workspace $dev
#workspace $web
#workspace $workspace4
#workspace $workspace5
#workspace $workspace6
#workspace $workspace7
#workspace $workspace8
#workspace $spotify
#workspace $workspace10

# switch to workspace
bindsym $mod+1 workspace $terminal
bindsym $mod+2 workspace $dev
bindsym $mod+3 workspace $web
bindsym $mod+4 workspace $workspace4 
bindsym $mod+5 workspace $workspace5
bindsym $mod+6 workspace $workspace6
bindsym $mod+7 workspace $workspace7
bindsym $mod+8 workspace $workspace8
bindsym $mod+9 workspace $spotify
bindsym $mod+0 workspace $workspace10
bindsym $mod+Tab workspace back_and_forth

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace $terminal
bindsym $mod+Shift+2 move container to workspace $dev
bindsym $mod+Shift+3 move container to workspace $web
bindsym $mod+Shift+4 move container to workspace $workspace4
bindsym $mod+Shift+5 move container to workspace $workspace5
bindsym $mod+Shift+6 move container to workspace $workspace6
bindsym $mod+Shift+7 move container to workspace $workspace7
bindsym $mod+Shift+8 move container to workspace $workspace8
bindsym $mod+Shift+9 move container to workspace $spotify
bindsym $mod+Shift+0 move container to workspace $workspace10
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# colors                BORDER      BACKGROUND TEXT        INDICATOR
client.focused          $primary    $primary   $background $primary
client.focused_inactive $background $primary   $foreground $background
client.unfocused        $gray       $gray      $background $secondary
client.urgent           $warning    $warning   $foreground $warning

# resize window (you can also use the mouse for that)

bindsym $mod+r mode "resize"

bindsym $mod+m mode "MusicControl"
#bind music-player keys to corresponding commands
bindcode 172 exec playerctl play-pause
bindcode 173 exec playerctl previous
bindcode 171 exec playerctl next
bindcode 174 exec playerctl stop
bindcode 122 exec amixer sset Master 1%-
bindcode 123 exec amixer sset Master 1%+


for_window [class="Spotify"] move to workspace $spotify

assign [class="ProjectM-pulseaudio"] $workspace10


bindsym $mod+Shift+x exec /usr/bin/keepass --auto-type

#modes
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym j resize shrink width 10 px or 10 ppt
        bindsym k resize grow height 10 px or 10 ppt
        bindsym l resize shrink height 10 px or 10 ppt
        bindsym semicolon resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape
        bindsym Return mode "default"
        bindsym Escape mode "default"
}

mode "MusicControl" {
	bindsym p exec playerctl play-pause, mode "default"
	bindsym k exec playerctl next
	bindsym j exec playerctl previous
	bindsym l exec amixer sset Master 3%-
	bindsym odiaeresis exec amixer sset Master 3%+
	
	bindsym Escape mode "default"
	bindsym Return mode "default"
}

#init programs
exec xrandr --output LVDS-1 --scale 1.171303x1.171303 --panning 1600x900
exec --no-startup-id compton
#
exec --no-startup-id urxvtd
exec_always feh --bg-fill ~/.config/themer/current/wallpaper.{png,jpg}
exec polybar main
exec --no-startup-id redshift
#exec --no-startup-id light-locker --lock-on-suspend
# vim: foldmethod=marker
exec xset -dpms s off