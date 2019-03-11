# General
c.auto_save.session = True
c.confirm_quit = ["downloads"]

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
c.tabs.title.format = "{perc}{index}: {title}"

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
    "man":     "https://jlk.fjfi.cvut.cz/arch/manpages/search?q={}",
    "mdn":     "https://developer.mozilla.org/en-US/search?q={}",
    "ml":      "https://lista.mercadolivre.com.br/{}",
    "pkg":     "https://repology.org/projects/?search={}",
    "yt":      "https://www.youtube.com/results?search_query={}",
    "w":       "https://en.wikipedia.org/w/index.php?search={}&title=Special:Search&go=Go"
}

# Colors
c.colors.statusbar.private.bg = "#400040"
c.colors.statusbar.command.private.bg = c.colors.statusbar.private.bg
c.colors.tabs.odd.bg = "black"
c.colors.tabs.odd.fg = "white"
c.colors.tabs.selected.odd.bg = "white"
c.colors.tabs.selected.odd.fg = "black"
c.colors.tabs.even.bg = c.colors.tabs.odd.bg
c.colors.tabs.even.fg = c.colors.tabs.odd.fg
c.colors.tabs.selected.even.bg = c.colors.tabs.selected.odd.bg
c.colors.tabs.selected.even.fg = c.colors.tabs.selected.odd.fg
c.colors.messages.warning.fg = "black"

# Fonts
c.fonts.tabs = "8pt sans"

# Nouveau hack
with open('/proc/modules', 'r') as file:
    for line in file:
        if "nouveau" in line:
            print("Found nouveau module, using software rendering")
            c.qt.force_software_rendering = "chromium"
            break
