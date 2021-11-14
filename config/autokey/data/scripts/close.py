window_class = window.get_active_class()

if window_class == 'spotify.Spotify':
    keyboard.press_key("<ctrl>")
    keyboard.press_key("<shift>")
    keyboard.press_key("w")
    keyboard.release_key("w")
    keyboard.release_key("<shift>")
    keyboard.release_key("<ctrl>")
    
    keyboard.press_key("<ctrl>")
    keyboard.press_key("<super>")
    keyboard.press_key("<left>")
    keyboard.release_key("<left>")
    keyboard.release_key("<super>")
    keyboard.release_key("<ctrl>")
else:
    keyboard.send_keys("<ctrl>+w")    

