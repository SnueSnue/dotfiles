add-highlighter global/ number-lines
add-highlighter global/ show-matching
set-option global tabstop 8
set-option global indentwidth 4
set-option global scrolloff 5,5

source "%val{config}/plugins/plug.kak/rc/plug.kak"
plug "andreyorst/plug.kak" noload

plug "evanrelf/number-toggle.kak" config %{require-module "number-toggle"}

plug "andreyorst/smarttab.kak"

plug "andreyorst/kaktree" config %{
    hook global WinSetOption filetype=kaktree %{
        remove-highlighter buffer/numbers
        remove-highlighter buffer/matching
        remove-highlighter buffer/wrap
        remove-highlighter buffer/show-whitespaces
    }
    kaktree-enable
}

plug "TeddyDD/kakoune-wiki"

plug "insipx/kak-crosshairs"

hook global WinCreate .*\.tex %{ map window normal q :w<ret>:%sh{rm *.fdb_latex; latexmk}<ret> }

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
