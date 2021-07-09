#!/usr/bin/perl

# obmenu-generator - schema file

=for comment

    item:      add an item inside the menu               {item => ["command", "label", "icon"]},
    cat:       add a category inside the menu             {cat => ["name", "label", "icon"]},
    sep:       horizontal line separator                  {sep => undef}, {sep => "label"},
    pipe:      a pipe menu entry                         {pipe => ["command", "label", "icon"]},
    raw:       any valid Openbox XML string               {raw => q(xml string)},
    begin_cat: begin of a category                  {begin_cat => ["name", "icon"]},
    end_cat:   end of a category                      {end_cat => undef},
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

    #          COMMAND                 LABEL                ICON
    # {item => ['pcmanfm',        'File Manager',      'system-file-manager']},
    # {item => ['lxterminal',             'Terminal',          'lxterminal']},
    # {item => ['firefox',  'Web Browser',       'web-browser']},
    # {item => ['rofi',             'Run command',       'system-run']},      

    {sep => 'Openbox Menu'},

    #          NAME            LABEL                ICON
    {cat => ['utility',     'Accessories', 'applications-utilities']},
    {cat => ['DebianDog',   'FossaDog Special', 'preferences-other']}, 
    {cat => ['development', 'Development', 'applications-development']},
    {cat => ['education',   'Education',   'applications-science']},
    {cat => ['game',        'Games',       'applications-games']},
    {cat => ['graphics',    'Graphics',    'applications-graphics']},
    {cat => ['audiovideo',  'Multimedia',  'applications-multimedia']},
    {cat => ['Modules',     'Module Tools','application-x-squashfs2']},
    {cat => ['network',     'Network',     'applications-internet']},
    {cat => ['office',      'Office',      'applications-office']},
    {cat => ['other',       'Other',       'applications-other']},
    {cat => ['settings',    'Settings',    'applications-accessories']},
    {cat => ['system',      'System',      'applications-system']},   

    #{cat => ['qt',          'QT Applications',    'qt4logo']},
    #{cat => ['gtk',         'GTK Applications',   'gnome-applications']},
    #{cat => ['x_xfce',      'XFCE Applications',  'applications-other']},
    #{cat => ['gnome',       'GNOME Applications', 'gnome-applications']},
    #{cat => ['consoleonly', 'CLI Applications',   'applications-utilities']},

    #                  LABEL          ICON
    #{begin_cat => ['My category',  'cat-icon']},
    #             ... some items ...
    #{end_cat   => undef},

    #            COMMAND     LABEL        ICON
    #{pipe => ['obbrowser', 'Disk', 'drive-harddisk']},

    ## Generic advanced settings
    #{sep       => undef},
    #{obgenmenu => ['Openbox Settings', 'openbox']},
    #{sep       => undef},

    ## Custom advanced settings
    {sep => undef},
    {begin_cat => ['Advanced Settings       ', 'gnome-settings']},

        # Configuration files
        {item => ["$editor ~/.config/tint2/tint2rc", 'Tint2 Config', 'text-x-source']},

        # obmenu-generator category
        {begin_cat => ['Obmenu-Generator', 'menu']},
            {item => ["$editor ~/.config/obmenu-generator/schema.pl", 'Menu Schema', 'text-x-source']},
            {item => ["$editor ~/.config/obmenu-generator/config.pl", 'Menu Config', 'text-x-source']},

            {sep  => undef},
            {item => ['obmenu-generator -p',       'Generate a pipe menu',              'menu']},
            {item => ['obmenu-generator -s -c',    'Generate a static menu',            'menu']},
            {item => ['obmenu-generator -p -i',    'Generate a pipe menu with icons',   'menu']},
            {item => ['obmenu-generator -s -i -c', 'Generate a static menu with icons', 'menu']},
            {sep  => undef},

            {item => ['obmenu-generator -d', 'Refresh Icon Set', 'gtk-refresh']},
        {end_cat => undef},

        # Openbox category
        {begin_cat => ['Openbox', 'openbox']},
            {item => ['openbox --reconfigure',               'Reconfigure Openbox', 'openbox']},
            {item => ["$editor ~/.config/openbox/autostart", 'Openbox Autostart',   'shellscript']},
            {item => ["$editor ~/.config/openbox/rc.xml",    'Openbox RC',          'text-xml']},
            {item => ["$editor ~/.config/openbox/menu.xml",  'Openbox Menu',        'text-xml']},
        {end_cat => undef},
        
        # screenshot, ob-desktop, nitrogen
        {begin_cat => ['Screenshot', 'camera-photo']},
			{item => ["scrot fossadog-%Y%m%d%H%M%S.jpg", 'Now']},
			{item => ["scrot -d 5 fossadog-%Y%m%d%H%M%S.jpg", 'In 5 Seconds...']},
			{item => ["scrot -d 10 fossadog-%Y%m%d%H%M%S.jpg", 'In 10 Seconds...']},
			{item => ["scrot -s fossadog-%Y%m%d%H%M%S.jpg", 'Selected Area...']},
			{item => ["scrot -s -d 5 fossadog-%Y%m%d%H%M%S.jpg", 'Selected Area in 5 seconds...']},
		{end_cat => undef},
        {item => ['ob-desktop',       'Desktop Manager',   'user-desktop']},
		{item => ["/usr/local/bin/setwallpaper",       'Set Wallpaper',   'nitrogen']},

    {end_cat => undef},
    {sep => undef},

    ## The xscreensaver lock command
    #{item => ['xscreensaver-command -lock', 'Lock', 'lock']},

    # This option uses the default Openbox's action "Exit"
    #{exit => ['Exit', 'exit']},
    #{item => ['wmreboot', 'Reboot', 'gnome-shutdown']},
    #{item => ['wmpoweroff', 'Shutdown', 'gnome-logout']},   
    # This uses the 'oblogout' menu
    #{item => ['openbox --exit', 'Exit', 'exit']},
#{begin_cat => ['Shutdown Menu', 'shutdown']},
 #   {item => ['wmreboot', 'Reboot', 'gnome-shutdown']},
#     {item => ['wmpoweroff', 'Shutdown', 'gnome-logout']},   
#     {item => ['pm-suspend', 'Suspend', 'suspend']},
#    {item => ['openbox --exit', 'Exit', 'exit']},
#{end_cat => undef}, 
    {item => ['obshutdown', 'Logout', 'gnome-shutdown']},
]
