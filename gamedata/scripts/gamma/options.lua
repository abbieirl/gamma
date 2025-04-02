local options = {
    id = "gamma",
    sh = true,
    gr = {
        {
            id = "slide_gamma",
            type = "slide",
            link = "ui_options_slider_other",
            text = "ui_mm_title_gamma",
            size = { 512, 50 },
        },
        {
            id = "engine",
            type = "list",
            val = 0,
            no_str = true,
            def = "llvm",
            curr = {},
            content = {
                { "singlepass", "singlepass" },
                { "cranelift",  "cranelift" },
                { "llvm",       "llvm" },
            }
        },
        {
            id = "line",
            type = "line",
        },
    },
}

return options
