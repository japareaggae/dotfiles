# Autoconfig loading
config.load_autoconfig()

# General
c.auto_save.session = True
c.confirm_quit = ["downloads"]
c.content.autoplay = False
c.content.notifications = False
c.colors.webpage.prefers_color_scheme_dark = True
c.editor.command = ["nvim-qt", "--nofork", "{file}", "--", "-c", "normal {line}G{column0}l"]
c.input.partial_timeout = 0

# Completion
c.completion.height = "40%"
c.completion.open_categories = ["quickmarks", "bookmarks", "history"]

# Downloads
c.downloads.position = "bottom"

# Tabs
c.tabs.background = True
c.tabs.indicator.width = 0
c.tabs.last_close = "close"
c.tabs.padding = {
    "bottom": 1,
    "top":    1,
    "left":   4,
    "right":  4
}
c.tabs.show = "multiple"
c.tabs.title.format = "{perc}{audio}{index}: {current_title}"

# URL
c.url.default_page = "about:blank"
c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}",
    "arch":    "https://www.archlinux.org/packages/?q={}",
    "aur":     "https://aur.archlinux.org/packages/?O=0&K={}",
    "aw":      "https://wiki.archlinux.org/index.php?search={}&title=Special:Search&go=Go",
    "bemani":  "https://remywiki.com/index.php?search={}&title=Special:Search&go=Go",
    "g":       "https://google.com/search?hl=en&q={}",
    "gh":      "https://github.com/search?q={}",
    "man":     "https://man.archlinux.org/search?q={}",
    "mdn":     "https://developer.mozilla.org/en-US/search?q={}",
    "ml":      "https://lista.mercadolivre.com.br/{}",
    "pkg":     "https://repology.org/projects/?search={}",
    "yt":      "https://www.youtube.com/results?search_query={}",
    "w":       "https://en.wikipedia.org/w/index.php?search={}&title=Special:Search&go=Go",
}

# Colors
config.source('colors.py')

# Fonts
c.fonts.default_size = "9pt"
c.fonts.tabs.selected = "8pt DejaVu Sans"
c.fonts.tabs.unselected = c.fonts.tabs.selected
c.fonts.web.family.fixed = "Liberation Mono"
c.fonts.web.family.sans_serif = "Liberation Sans"
c.fonts.web.family.serif = "Liberation Serif"
c.fonts.web.family.standard = c.fonts.web.family.serif
c.fonts.web.family.fantasy = c.fonts.web.family.serif
c.fonts.web.family.cursive = c.fonts.web.family.serif

# Keybinds
config.bind('po', 'set-cmd-text -s :open -p')
config.bind(';p', 'hint links spawn mpv {hint-url}')
config.bind(',p', 'spawn --userscript qute-pass -d dmenu -U secret -u \'Username: (.*)\' ')
config.bind(',P', 'spawn --userscript qute-pass -d dmenu --password-only')
config.bind(',q', 'spawn --userscript qr')

# Aliases
c.aliases['mpv'] = "spawn --userscript view-in-mpv"
c.aliases['qrcode'] = "spawn --userscript qrcode"

# Nouveau hack
with open('/proc/modules', 'r') as file:
    for line in file:
        if "nouveau" in line:
            print("Found nouveau module, using software rendering")
            c.qt.force_software_rendering = "chromium"
            break

