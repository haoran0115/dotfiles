/* See LICENSE file for copyright and license deytails. */

/* appearance */
static const unsigned int borderpx  = 0;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 10;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 10;       /* vert inner gap between windows */
static const unsigned int gappoh    = 10;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 10;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { 
    "NotoSansM Nerd Font:size=12", 
    "Noto Sans CJK SC:size=12", 
};
static const char dmenufont[]       = "NotoSansM Nerd Font:size=12";
static unsigned int baralpha        = 0xff;
static unsigned int borderalpha     = 0xff;
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";

static const char nord_polar_darkest_blue[]        = "#2E3440";
static const char nord_polar_darker_blue[]        = "#3B4252";
static const char nord_polar_lighter_dark_blue[]        = "#434C5E";
static const char nord_polar_lightest_dark_blue[]        = "#4C566A";
static const char nord_dark_white[]        = "#D8DEE9";
static const char nord_darker_white[]        = "#E5E9F0";
static const char nord_white[]        = "#ECEFF4";
static const char nord_white_dark[]        = "#d8dee9";
static const char nord_frost_light_blue[]        = "#8FBCBB";
static const char nord_frost_darker_light_blue[]        = "#88C0D0";
static const char nord_frost_lighter_dark_blue[]        = "#81A1C1";
static const char nord_frost_dark_blue[]        = "#5E81AC";
static const char nord_red[]        = "#BF616A";
static const char nord_orange[]        = "#D08770";
static const char nord_yellow[]        = "#EBCB8B";
static const char nord_green[]        = "#A3BE8C";
static const char nord_purple[]        = "#B48EAD";


/* static const char *colors[][3]      = { */
/* 	/1*               fg         bg         border   *1/ */
/* 	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 }, */
/* 	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  }, */
/* }; */

static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { nord_white, nord_polar_darkest_blue, nord_polar_darkest_blue },
	[SchemeSel]  = { nord_polar_darkest_blue, nord_frost_darker_light_blue,  nord_red },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	/* { "Gimp",     NULL,       NULL,       0,            1,           -1 }, */
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
    { NULL,      NULL,       "VMD",          0,         1,           -1 },
    { "Gview.exe", "gview.exe",      NULL,            0,            1,      -1 },
    { NULL,      NULL,       "VMD Main",          0,         1,           -1 },
    { NULL,       NULL, "pdfpc - presenter",   0,       0,            0 },
    { NULL,       NULL, "pdfpc - presentation",   0,    0,            1 },
    
};

/* layout(s) */
static const float mfact     = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"
#include "nextprevtag.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "[M]",      monocle },
	{ "[\\]",     dwindle },
	{ "[@]",      spiral },
	{ "H[]",      deck },
	{ "TTT",      bstack },
	{ "===",      bstackhoriz },
	{ "HHH",      grid },
	{ "###",      nrowgrid },
	{ "---",      horizgrid },
	{ ":::",      gaplessgrid },
	{ "|M|",      centeredmaster },
	{ ">M>",      centeredfloatingmaster },
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod1Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
/* default commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", dmenufont, "-nb", nord_polar_darkest_blue, "-nf", nord_white, "-sb", nord_frost_darker_light_blue, "-sf", nord_polar_darkest_blue, NULL , "-p", "run: "};
static const char *termcmd[]  = { "terminal.sh", NULL };
/* static const char *termcmd[]  = { "alacritty.sh", NULL }; */
//static const char *termcmd[]  = { "alacritty", NULL };

/* rofi commands */
static const char *rofirundmc[] = { "rofi_run.sh", NULL };
static const char *rofidrundmc[] = { "rofi_drun.sh", NULL };
static const char *rofigreenclip[] = { "rofi-greenclip.sh", NULL };

/* dmenu greenclip commands */
static const char *dmenugreenclip[] = { "dmenu-greenclip.sh", NULL };

/* Screenshot commands */
static const char *flameshotcmd[] = { "/usr/bin/flameshot", "gui", NULL };
static const char *flameshotfullcmd[] = { "flameshot", "full", "-p", "~/Pictures/Screenshots", ">> ~/tmp/flameshot_debug.log", NULL };
static const char *maimfullcmd[] = { "/bin/sh", "-c", "maim --hidecursor ~/Pictures/Screenshots/$(date +%F-%H_%M_%S).png", NULL };
static const char *maimselectcmd[] = { "/bin/sh", "-c", "maim --hidecursor -s ~/Pictures/Screenshots/$(date +%F-%H_%M_%S).png", NULL };
static const char *maimscriptfullcmd[] = { "/bin/sh", "-c", "~/.local/bin/maim_notify.sh", NULL };
static const char *maimscriptselectcmd[] = { "/bin/sh", "-c", "~/.local/bin/maim_notify.sh -s", NULL };
/* clipmenu: show clipboard history */
static const char *clipmemutogglecmd[] = {"/home/shiroha/.local/bin/clipmenu.sh", NULL};
/* dunst toggle notification history */
static const char *dunsthisotry[] = { "dunstctl", "history-pop", NULL };

/* volume commands */
static const char *volup[] = {"/usr/bin/amixer", "set", "Master", "2.5%+", NULL};
static const char *voldown[] = {"/usr/bin/amixer", "set", "Master", "2.5%-", NULL};
static const char *volmute[] = {"/usr/bin/amixer", "set", "Master", "toggle", NULL};

/* brightness commands */
// xbacklight only work with intel
/* static const char *brightnessup[] = {"/usr/bin/brightnessctl", "set", "5%+", NULL}; */
/* static const char *brightnessdown[] = {"/usr/bin/brightnessctl", "set", "5%-", NULL}; */
static const char *brightnessup[] = {"/usr/bin/light", "-A", "5", NULL};
static const char *brightnessdown[] = {"/usr/bin/light", "-U", "5", NULL};

/* lock screen */
static const char *lock[] = {"lock.sh", NULL};

#include "movestack.c"
static const Key keys[] = {
	/* modifier                     key        function        argument */
    /* costumized keybindings */
    /* Screenshot */
	{ 0,                            XK_Print,  spawn,          
        SHCMD("NAME=$HOME/Pictures/Screenshots/$(date +%F-%H_%M_%S).png\n \
        maim --hidecursor -s $NAME \
        && xclip-copyfile \"$NAME\" \
        && notify-send  \"Screenshot saved as $NAME\"") },   /* prtsrc select screen */
	{ Mod4Mask,                    XK_Print,  spawn,          
        SHCMD("NAME=$HOME/Pictures/Screenshots/$(date +%F-%H_%M_%S).png\n \
        maim --hidecursor $NAME \
        && xclip-copyfile \"$NAME\" \
        && notify-send  \"Screenshot saved as $NAME\"") },   /* prtsrc full screen */
    /* flameshot */
    { 0,                               XK_F9,  spawn,          {.v = flameshotcmd} },
    /* volume */
	{ 0,                       XF86XK_AudioRaiseVolume, spawn, {.v = volup} },
	{ 0,                       XF86XK_AudioLowerVolume, spawn, {.v = voldown } },
	{ 0,                       XF86XK_AudioMute, spawn, {.v = volmute } },
    /* brightness */
    {0,                  XF86XK_MonBrightnessUp, spawn, {.v = brightnessup } },
    {0,                XF86XK_MonBrightnessDown, spawn, {.v = brightnessdown } },
    /* screen lock */
    { Mod4Mask, XK_l, spawn, 
        SHCMD("betterlockscreen -l --display 1")},
    /* clipmenu */
    { Mod4Mask, XK_v, spawn, 
        SHCMD("greenclip print | grep . | dmenu -i | xargs -r -d\'\\n\' -I \'\{\}\' greenclip print \'\{\}\'")},
    /* dunst history */
    { Mod4Mask,                     XK_a,  spawn,          {.v = dunsthisotry } },
    /* move to previous/next tag */
    { MODKEY|ControlMask,          XK_Right,            view_adjacent,  { .i = +1 } },
    { MODKEY|ControlMask,           XK_Left,            view_adjacent,  { .i = -1 } },
    /* default keybindings */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	// { MODKEY,                       XK_p,      spawn,          {.v = rofirundmc } },
	{ MODKEY|ShiftMask,             XK_p,      spawn,          SHCMD("rofi -show drun -show-icons") },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          SHCMD("kitty --directory \"$(xcwd)\"") },
    // open ranger
    { Mod4Mask,                       XK_e,      spawn,          SHCMD("kitty ranger") },
    { Mod4Mask|ShiftMask,                       XK_e,      spawn,          SHCMD("nautilus \"$(xcwd)\"") },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY|Mod4Mask,              XK_u,      incrgaps,       {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_u,      incrgaps,       {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_i,      incrigaps,      {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_i,      incrigaps,      {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_o,      incrogaps,      {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_o,      incrogaps,      {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_6,      incrihgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_6,      incrihgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_7,      incrivgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_7,      incrivgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_8,      incrohgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_8,      incrohgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_9,      incrovgaps,     {.i = +1 } },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_9,      incrovgaps,     {.i = -1 } },
	{ MODKEY|Mod4Mask,              XK_0,      togglegaps,     {0} },
	{ MODKEY|Mod4Mask|ShiftMask,    XK_0,      defaultgaps,    {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[1]} }, // monocle layout
	{ MODKEY,                       XK_r,      setlayout,      {.v = &layouts[3]} }, // spiral layout
	{ MODKEY|ShiftMask,             XK_r,      setlayout,      {.v = &layouts[2]} }, // dwindle layout
	{ MODKEY,                       XK_g,      setlayout,      {.v = &layouts[7]} }, // grid layout
	{ MODKEY,                       XK_c,      setlayout,      {.v = &layouts[11]} }, // centeredmaster
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[13]} }, // float
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY|ShiftMask,             XK_f,      togglefullscr,  {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

