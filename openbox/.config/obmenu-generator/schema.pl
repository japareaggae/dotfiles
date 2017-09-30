#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    file:      include the content of an XML file        {file => "/path/to/file.xml"},
    raw:       any XML data supported by Openbox          {raw => q(...)},
    beg:       begin of a category                        {beg => ["name", "icon"]},
    end:       end of a category                          {end => undef},
    obgenmenu: generic menu settings                {obgenmenu => ["label", "icon"]},
    exit:      default "Exit" action                     {exit => ["label", "icon"]},

=cut

# NOTE:
#    * Keys and values are case sensitive. Keep all keys lowercase.
#    * ICON can be a either a direct path to an icon or a valid icon name
#    * Category names are case insensitive. (X-XFCE and x_xfce are equivalent)

require "$ENV{HOME}/.config/obmenu-generator/config.pl";

## Text editor
my $editor = $CONFIG->{editor};

our $SCHEMA = [

    {sep => 'Favorites'},
    #          COMMAND                 LABEL              ICON
    {item => ['xdg-open .',       'File Manager', 'system-file-manager']},
    {item => ['termite',          'Terminal',     'utilities-terminal']},
    {sep => undef},
    {item => ['~/.nightly/firefox', 'Nightly',  'nightly']},
    {item => ['steam',              'Steam',    'steam']},
    {item => ['telegram-desktop',   'Telegram', 'telegram']},
    {item => ['teamspeak3',         'TeamSpeak 3', 'teamspeak3']},

    {sep => 'Categories'},
    #          NAME            LABEL                ICON
    {cat => ['utility',     'Accessories', 'applications-utilities']},
    {cat => ['development', 'Development', 'applications-development']},
    {cat => ['education',   'Education',   'applications-science']},
    {cat => ['game',        'Games',       'applications-games']},
    {cat => ['graphics',    'Graphics',    'applications-graphics']},
    {cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
    {cat => ['network',     'Network',     'applications-internet']},
    {cat => ['office',      'Office',      'applications-office']},
    {cat => ['other',       'Other',       'applications-other']},
    {cat => ['settings',    'Settings',    'applications-accessories']},
    {cat => ['system',      'System',      'applications-system']},

    ## Settings
    {sep       => 'Settings'},
    {beg => ['Openbox Settings', 'applications-engineering']},
      {beg => ['Openbox', 'openbox']},
        {item      => ["$editor ~/.config/openbox/autostart", 'Openbox Autostart',   'text-x-generic']},
        {item      => ["$editor ~/.config/openbox/rc.xml",    'Openbox RC',          'text-x-generic']},
        {item      => ["$editor ~/.config/openbox/menu.xml",  'Openbox Menu',        'text-x-generic']},
        {sep => undef},
        {item      => ['openbox --reconfigure',               'Reconfigure Openbox', 'view-refresh']},
        {item      => ['openbox --restart',                   'Restart Openbox',     'view-refresh']},
      {end => undef},
      {beg => ['tint2', 'tint2']},
        {item => ["$editor ~/.config/tint2/tint2rc", 'tint2rc', 'text-x-generic']},
      {end => undef},
      {beg => ['Obmenu-Generator', 'accessories-text-editor']},
        {item      => ["$editor ~/.config/obmenu-generator/schema.pl", 'Menu Schema', 'text-x-generic']},
        {item      => ["$editor ~/.config/obmenu-generator/config.pl", 'Menu Config', 'text-x-generic']},
      {end => undef},
    {end => undef},
    {sep => undef},
    {item => ['light-locker-command -l', 'Lock', 'system-lock-screen']},
    {item => ['obsession-logout', 'Leave', 'application-exit']},
]

# vim: set ts=2 sw=2 et:
