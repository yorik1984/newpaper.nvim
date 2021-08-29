lua << EOF
    -- clear cache so this reloads changes.
    -- useful for development
    package.loaded['newpaper']        = nil
    package.loaded['newpaper.util']   = nil
    package.loaded['newpaper.colors'] = nil
    package.loaded['newpaper.theme']  = nil
    package.loaded['newpaper.config'] = nil
    package.loaded['newpaper.style']  = nil
EOF
