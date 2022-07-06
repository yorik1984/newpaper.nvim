local M = {}

function M.setup(configColors)

    -- stylua: ignore start

    local deviconSyn  = {}
    deviconSyn.colors = configColors
    local newpaper    = deviconSyn.colors

    deviconSyn.loadPlugins = function()
        local plugins = {}
        local devIcons = {
            Ai                  = { fg = newpaper.olive },
            Awk                 = { fg = newpaper.teal },
            Bat                 = { fg = newpaper.green },
            Bash                = { fg = newpaper.nephritis },
            BashProfile         = { fg = newpaper.nephritis },
            Bashrc              = { fg = newpaper.nephritis },
            Brewfile            = { fg = newpaper.maroon },
            Coffee              = { fg = newpaper.olive },
            Configuration       = { fg = newpaper.darkgrey },
            ConfigRu            = { fg = newpaper.redorange },
            Crystal             = { fg = newpaper.fg },
            Csh                 = { fg = newpaper.grey },
            Cson                = { fg = newpaper.olive },
            Csv                 = { fg = newpaper.darkengreen },
            Cs                  = { fg = newpaper.green },
            Css                 = { fg = newpaper.purple },
            Db                  = { fg = newpaper.grey },
            DesktopEntry        = { fg = newpaper.purple },
            Diff                = { fg = newpaper.git_fg },
            Dockerfile          = { fg = newpaper.tag_navy },
            DsStore             = { fg = newpaper.teal },
            Drools              = { fg = newpaper.redorange },
            Dump                = { fg = newpaper.lightgrey },
            Haml                = { fg = newpaper.tag_navy },
            Ejs                 = { fg = newpaper.olive },
            Env                 = { fg = newpaper.orange },
            Erb                 = { fg = newpaper.redorange },
            Fennel              = { fg = newpaper.ocean },
            Fish                = { fg = newpaper.grey },
            Gemfile             = { fg = newpaper.redorange },
            Gemspec             = { fg = newpaper.redorange },
            GitAttributes       = { fg = newpaper.git_fg },
            GitCommit           = { fg = newpaper.git_fg },
            GitConfig           = { fg = newpaper.git_fg },
            GitModules          = { fg = newpaper.git_fg },
            GitIgnore           = { fg = newpaper.git_fg },
            Ico                 = { fg = newpaper.darkyellow },
            ImportConfiguration = { fg = newpaper.darkgrey },
            Java                = { fg = newpaper.redorange },
            Js                  = { fg = newpaper.olive },
            Json                = { fg = newpaper.olive },
            Ksh                 = { fg = newpaper.grey },
            Less                = { fg = newpaper.purple },
            Log                 = { fg = newpaper.fg },
            Md                  = { fg = newpaper.fg },
            Mjs                 = { fg = newpaper.olive },
            Nim                 = { fg = newpaper.darkyellow },
            OpenTypeFont        = { fg = newpaper.teal },
            PackageLockJson     = { fg = newpaper.maroon },
            Pdf                 = { fg = newpaper.redorange },
            Prisma              = { fg = newpaper.fg },
            Py                  = { fg = newpaper.python_blue },
            Pyc                 = { fg = newpaper.python_blue },
            Pyd                 = { fg = newpaper.python_blue },
            Pyo                 = { fg = newpaper.python_blue },
            Rake                = { fg = newpaper.redorange },
            Rakefile            = { fg = newpaper.redorange },
            Rb                  = { fg = newpaper.redorange },
            Rs                  = { fg = newpaper.rust_green },
            Sql                 = { fg = newpaper.darkgrey },
            Sh                  = { fg = newpaper.grey },
            Txt                 = { fg = newpaper.tag_navy },
            Tex                 = { fg = newpaper.tex_part_title },
            TextResource        = { fg = newpaper.olive },
            Typefont            = { fg = newpaper.teal },
            Webmanifest         = { fg = newpaper.tag_navy },
            Zsh                 = { fg = newpaper.nephritis },
            Zshenv              = { fg = newpaper.nephritis },
            ZshProfile          = { fg = newpaper.nephritis },
            Zshrc               = { fg = newpaper.nephritis },
        }
        for key, value in pairs(devIcons) do
            plugins["DevIcon" .. key] = value
        end
        return plugins
    end

    -- stylua: ignore end

    return deviconSyn
end

return M
