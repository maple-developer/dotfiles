vim.cmd [[
    let g:translator_window_type = 'popup'
    let g:translator_default_engines = ['bing', 'haici', 'youdao', 'google']
    let g:translator_proxy_url = 'socks5://127.0.0.1:1090'

    " Text highlight of translator window
    hi def link TranslatorQuery             Identifier
    hi def link TranslatorDelimiter         Special
    hi def link TranslatorExplain           Statement

    " Background of translator window border
    hi def link Translator                  Normal
    hi def link TranslatorBorder            NormalFloat
]]

local map = vim.api.nvim_set_keymap
map('v', '<Space>t', '<CMD>TranslateW<CR>', { noremap = true }) 
map('v', '<Space>tr', '<CMD>Translater<CR>', { noremap = true }) 
