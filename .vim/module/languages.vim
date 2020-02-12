Plug 'hail2u/vim-css3-syntax', { 'for': ['scss', 'css', 'jsx', 'tsx', 'vue'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': ['scss', 'vue'] }
Plug 'ekalinin/Dockerfile.vim', { 'for': 'docker' }

Plug 'fatih/vim-go', { 'for': ['go'] }
Plug 'buoto/gotests-vim', { 'for': ['go'] }
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'

Plug 'othree/html5.vim', { 'for': ['html', 'jsx', 'tsx', 'vue'] }

Plug 'HerringtonDarkholme/yats.vim', { 'for': ['typescript'] }
Plug 'elzr/vim-json', { 'for': ['json'] }
Plug 'jparise/vim-graphql', { 'for': ['jsx', 'javascript', 'gql', 'graphql', 'typescript'] }
Plug 'mxw/vim-jsx', { 'for': ['jsx'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript'] }
Plug 'styled-components/vim-styled-components', { 'branch': 'main', 'for': ['javascript'] }
let g:javascript_plugin_flow = 1
let g:javascript_plugin_jsdoc = 1
let g:used_javascript_libs = 'react'

Plug 'plasticboy/vim-markdown', { 'for': ['markdown'] }

let g:vim_markdown_autowrite = 1
let g:vim_markdown_fenced_languages = [ 'csharp=cs', 'js=javascript' ]
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_no_extensions_in_markdown = 1

Plug 'tpope/vim-rails', { 'for': ['ruby'] }
Plug 'noprompt/vim-yardoc', { 'for': ['ruby'] }
Plug 'tpope/vim-haml', { 'for': ['haml'] }
Plug 'vim-ruby/vim-ruby', { 'for': ['ruby'] }

" Plug 'racer-rust/vim-racer', { 'for': 'rust' }
" Plug 'rust-lang/rust.vim', { 'for': 'rust' }

" let g:racer_cmd = "/Users/jamesapple/.cargo/bin/racer"
" let g:racer_experimental_completer = 1

Plug 'tpope/vim-eunuch'

Plug 'hashivim/vim-terraform', { 'for': 'tf' }

let g:terraform_align=1
let g:terraform_fold_sections=1
