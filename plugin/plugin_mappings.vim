""" nvim-lspconfig
nnoremap <silent> gD <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> <leader>q <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> <leader>f <cmd>lua vim.lsp.buf.formatting()<CR>

"""  vim-etf
nmap ; <Plug>(eft-repeat)
xmap ; <Plug>(eft-repeat)

nmap f <Plug>(eft-f)
xmap f <Plug>(eft-f)
omap f <Plug>(eft-f)
nmap F <Plug>(eft-F)
xmap F <Plug>(eft-F)
omap F <Plug>(eft-F)

nmap t <Plug>(eft-t)
xmap t <Plug>(eft-t)
omap t <Plug>(eft-t)
nmap T <Plug>(eft-T)
xmap T <Plug>(eft-T)
omap T <Plug>(eft-T)
