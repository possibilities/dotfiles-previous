c.url.searchengines = {
    'DEFAULT':  'https://google.com/search?hl=en&q={}'
}

config.bind('K', 'tab-next')
config.bind('J', 'tab-prev')

config.set("colors.webpage.bg", "black")
config.set("tabs.show", "switching")

c.url.default_page = "about:blank"
c.url.start_pages = ["about:blank"]
config.load_autoconfig()
