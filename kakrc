# Options
colorscheme pink
add-highlighter global/ number-lines -hlcursor -relative -separator "  " -cursor-separator " |"
add-highlighter global/ show-matching
set-option global tabstop 8
set-option global indentwidth 4
set-option global scrolloff 8,5
set-option global ui_options terminal_assistant=none

# Plugins
## Setup plug.kak
source "%val{config}/plugins/plug.kak/rc/plug.kak"
plug "andreyorst/plug.kak" noload

## indent with spaces instead of tabs
plug "andreyorst/smarttab.kak" defer smarttab %{
    set-option global softtabstop 4
} config %{
    hook global BufOpenFile .* expandtab
    hook global BufNewFile .* expandtab
    # Use tabs in these files
    hook global WinSetOption filetype=(makefile) noexpandtab
}

## file tree
plug "andreyorst/kaktree" config %{
    hook global WinSetOption filetype=kaktree %{
        remove-highlighter buffer/numbers
        remove-highlighter buffer/matching
        remove-highlighter buffer/wrap
        remove-highlighter buffer/show-whitespaces
    }
    kaktree-enable
}

## Allow following links in md files
plug "SnueSnue/kakoune-wiki"

## Fuzzy finding in kak
plug "andreyorst/fzf.kak" %{
    require-module fzf
    require-module fzf-grep
    require-module fzf-file
} defer fzf %{
    set-option global fzf_highlight_command "cat {}"
} defer fzf-file %{
    set-option global fzf_file_command "fd . --no-ignore-vcs"
} defer fzf-grep %{
    set-option global fzf_grep_command "fd"
}

## More information in information line on bottom of screen
plug "andreyorst/powerline.kak" defer powerline %{
    powerline-format global "git bufname filetype mode_info line_column position"
    set-option global powerline_separator_thin ""
    set-option global powerline_separator ""
} defer powerline_pink %{
    powerline-theme pink
    }config %{
    powerline-start
}

## Allow selecting multiple lines with x and X
plug "evanrelf/byline.kak" config %{
    require-module "byline"
}

## ALlow kak plugins that require lua
plug "gustavo-hms/luar" %{
    require-module luar
}

## Allow lsp possibilites
plug "kak-lsp/kak-lsp" do %{
    cargo install --locked --force --path .
}

# Global hooks

## auto latexmk in .tex documents
hook global WinCreate .*\.tex %{ map window normal q :w<ret>:%sh{rm *.fdb_latex; latexmk}<ret> }

## enable kak wiki and linewrap, when in .md documents
hook global WinCreate .*\.md %{
    wiki_enable
    add-highlighter -override global/markdown-wrap wrap -word

    hook -once -always window WinSetOption filetype=.* %{
        remove-highlighter global/markdown-wrap
        }
}

# Cycle autocomplete with tab
hook global InsertCompletionShow .* %{
    try %{
        exec -draft 'h<a-K>\h<ret>'
        map window insert <s-tab> <c-p>
        map window insert <tab> <c-n>
    }
}
hook global InsertCompletionHide .* %{
    unmap window insert <tab> <c-n>
    unmap window insert <s-tab> <c-p>
}

# Global normal maps

## remap b to q, so it is together with w and e
map global normal q b
map global normal Q B
map global normal <a-q> <a-b>
map global normal <a-Q> <a-B>

## unselect on <esc>
map global normal <esc> ";,"

## Comment lines
map global normal <c-v> ":comment-line<ret>"

# User space

## Insert newlines
map -docstring "Insert newline above" global user [ "O<esc>j"
map -docstring "Insert newline below" global user ] "o<esc>k"

## Copy to and paste from system clipboard
map -docstring "Copy to system clipboard" global user y "<a-|> xclip -selection clipboard<ret>"
map -docstring "Paste from system clipboard" global user p "<a-!> xclip -o -selection clipboard<ret>"

## Buffer navigation
map -docstring "Close current buffer" global user b ": db<ret>"
map -docstring "goto previous buffer" global user n ": bp<ret>"
map -docstring "goto next buffer" global user m ": bn<ret>"

## Fuzzy finding
map -docstring "open fzf" global user f ": fzf-mode<ret>"

## LSP mode
map -docstring "open lsp" global user l ": enter-user-mode lsp<ret>"

## Kaktree
map -docstring "toggle kaktree" global user t ": kaktree-toggle<ret>"

## Open selected link in firefox
map -docstring "open link in firefox" global user o "!xargs -i{} firefox {}<ret>"

# My commands

## Export to ...

define-command export-md-to-pdf %{ evaluate-commands %sh{
    pandoc -s -N --template=/home/snue/misc/templates/template.tex $kak_buffile -o $(dirname $kak_buffile)/$(basename $kak_buffile .md).pdf
    printf "echo exported to $(dirname kak_buffile)/$(basename $kak_buffile .md).pdf"
    # printf "pandoc -s -N --template=/home/snue/misc/kak_templates/template.tex $kak_buffile -o $(dirname $kak_buffile")}
}

define-command insert-header %{ execute-keys 'i---<ret>title:<ret>header-left:<ret>---<esc>'}

