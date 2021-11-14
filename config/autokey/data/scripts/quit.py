window_class = window.get_active_class()

ignored_apps = ['terminator.Terminator', 'google-chrome.Google-chrome']

if not window_class in ignored_apps:
    keyboard.press_key("<alt>")
    keyboard.press_key("<f4>")
    keyboard.release_key("<f4>")
    keyboard.release_key("<alt>")
    

