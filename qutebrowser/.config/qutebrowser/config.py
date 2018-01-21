# General
c.auto_save.session = True
c.confirm_quit = ["downloads"]

# Completion
c.completion.height = "40%"

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
    "mdn":     "https://developer.mozilla.org/en-US/search?q={}",
    "w":       "https://en.wikipedia.org/w/index.php?search={}&title=Special:Search&go=Go"
}

# Colors
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

