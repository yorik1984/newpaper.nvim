lua << EOF
package.loaded['newpaper'] = nil
package.loaded['newpaper.util'] = nil
package.loaded['newpaper.colors'] = nil
package.loaded['newpaper.theme'] = nil
package.loaded['newpaper.functions'] = nil

require('newpaper').set()
EOF
