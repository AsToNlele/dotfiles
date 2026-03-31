return {
    "lervag/vimtex",
    ft = { "tex", "plaintex", "bib" },
    config = function ()
        vim.g.vimtex_view_method = "skim"
    end
}
