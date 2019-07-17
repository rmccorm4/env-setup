#!/bin/bash

VIMHOME="${HOME}"
VIMRC="${VIMHOME}/.vimrc"
VIMDIR="${VIMHOME}/.vim"

### Golang ###
function setup_go {
    echo "Setting up Go for Vim"
    echo "Installing vim-go plugin..."
    git clone -q https://github.com/fatih/vim-go.git        ${VIMDIR}/pack/plugins/start/vim-go || true

    echo "Appending Go related lines to ${VIMRC}..."
    cat <<ENDGO >> ${VIMRC}

"=== Automated Golang Setup ===
let g:go_fmt_command = "goimports"    " Run goimports along gofmt on each save
let g:go_auto_type_info = 1           " Automatically get signature/type info for object under cursor
ENDGO

}

function setup_nerdtree {
    echo "Installing NERDTree plugin..."
    git clone -q https://github.com/scrooloose/nerdtree.git ${VIMDIR}/pack/dist/start/nerdtree || true
    cat <<ENDNERDTREE >> ${VIMRC}

"=== Automated NERDTree Setup ===
" NERDTree plugin specific commands
:nnoremap <C-n> :NERDTreeToggle<CR>
ENDNERDTREE
}

function setup_theme {
    echo "Installing vim-airline plugin..."
    git clone -q https://github.com/vim-airline/vim-airline ${VIMDIR}/pack/dist/start/vim-airline || true
    echo "Installing vim-fugitive plugin..."
    git clone -q https://github.com/tpope/vim-fugitive.git  ${VIMDIR}/pack/dist/start/vim-fugitive || true

    echo "Appending theme related lines to ${VIMRC}..."
    cat <<ENDTHEME >> ${VIMRC}

"=== Automated Theme Setup ===
" air-line plugin specific commands
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
ENDTHEME

}

function main() {
    echo "Creating ${VIMDIR} if it doesn't already exist..."
    mkdir -p ${VIMDIR}

    BACKUP="${VIMRC}.bkp"
    BACKUP_NUM=`ls ${BACKUP}* | wc -l`
    BACKUP="${BACKUP}.${BACKUP_NUM}"
    echo "Backing up old ${VIMRC} to ${BACKUP} ..."
    cp ${VIMRC} ${BACKUP}

    BASE="vimrc.minimal"
    echo "Copying over ${BASE} to ${VIMRC}..."
    cp ${BASE} ${VIMRC}

    setup_go
    setup_theme
    setup_nerdtree

    echo "Done."
}

main
