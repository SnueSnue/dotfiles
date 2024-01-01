# Color palette
declare-option str dark_pink 'rgb:2e001c'
declare-option str dark 'rgb:1d2021'
declare-option str gray 'rgb:5c9baa'
declare-option str aqua 'rgb:8ec07c'
declare-option str white 'rgb:f435ae'
declare-option str blue 'rgb:83a598'
declare-option str cyan 'rgb:8be9fd'
declare-option str green 'rgb:b8bb26'
declare-option str peach 'rgb:E5C07B'
declare-option str orange 'rgb:fe8019'
declare-option str pink 'rgb:F879C6'
declare-option str purple 'rgb:d3869b'
declare-option str red 'rgb:fb4934'
declare-option str light_pink 'rgb:ce0484'
declare-option str dimgray 'rgb:424242'

declare-option str psel 'rgba:59435580'
declare-option str ssel 'rgba:4f2f4780'
declare-option str background %opt{dark_pink}
declare-option str dimmed_background %opt{gray}
declare-option str foreground %opt{white}

# Reference
# https://github.com/mawww/kakoune/blob/master/colors/default.kak
# For code
set-face global value "%opt{purple}"
set-face global type "%opt{aqua}"
set-face global variable "%opt{orange}"
set-face global module "%opt{white}"
set-face global function "%opt{aqua}"
set-face global string "%opt{green}"
set-face global keyword "%opt{red}"
set-face global operator "%opt{pink}"
set-face global attribute "%opt{orange}"
set-face global bracket "%opt{white}+b"
set-face global argument "%opt{orange}"
set-face global comma "%opt{white}"
# set-face global constant "%opt{white}+b"
set-face global comment "%opt{gray}+i"
set-face global meta "%opt{aqua}"
set-face global builtin "%opt{aqua}+b"

# For markup
set-face global title "%opt{pink}"
set-face global header "%opt{orange}"
set-face global bold "%opt{pink}"
set-face global italic "%opt{purple}"
set-face global mono "%opt{green}"
set-face global block "%opt{cyan}"
set-face global link "%opt{green}"
set-face global bullet "%opt{green}"
set-face global list "%opt{white}"

# Builtin faces
set-face global Default "%opt{white},%opt{dark_pink}"
# set-face global Default "%opt{white},default"
set-face global PrimarySelection "default,%opt{psel}"
set-face global SecondarySelection "default,%opt{ssel}"
set-face global PrimaryCursor "%opt{dark},%opt{purple}"
set-face global SecondaryCursor "%opt{dark},%opt{aqua}"
set-face global PrimaryCursorEol "%opt{dark},%opt{light_pink}"
set-face global SecondaryCursorEol "%opt{dark},%opt{cyan}"
set-face global LineNumbers "%opt{gray},%opt{dark_pink}"
set-face global LineNumberCursor "%opt{light_pink},%opt{dark_pink}+b"
set-face global LineNumbersWrapped "%opt{gray},%opt{dark_pink}+i"
set-face global MenuForeground "%opt{dark},%opt{white}+b"
set-face global MenuBackground "%opt{white},%opt{dark}"
set-face global MenuInfo "%opt{dark},%opt{orange}"
set-face global Information "%opt{light_pink},%opt{dark_pink}"
set-face global Error "%opt{red},%opt{dark_pink}"
set-face global StatusLine "%opt{white},%opt{dark_pink}"
set-face global StatusLineMode "%opt{aqua},%opt{dark_pink}"
set-face global StatusLineInfo "%opt{purple},%opt{dark_pink}"
set-face global StatusLineValue "%opt{orange},%opt{dark_pink}"
set-face global StatusCursor "%opt{white},%opt{blue}"
set-face global Prompt "%opt{green},%opt{dark_pink}"
set-face global MatchingChar "%opt{blue},%opt{dark_pink}"
set-face global Whitespace "%opt{dimgray},%opt{dark_pink}+f"
set-face global WrapMarker Whitespace
set-face global BufferPadding "%opt{gray},%opt{dark_pink}"
