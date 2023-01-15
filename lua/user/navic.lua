local status_ok, barbecue = pcall(require, "barbecue")
if not status_ok then
    return
end

barbecue.setup {
    symbols = {
        ---modification indicator
        ---@type string
        modified = "●",

        ---truncation indicator
        ---@type string
        ellipsis = "…",

        ---entry separator
        ---@type string
        separator = "",
    },
    kinds = {
        File = "",
        Package = "",
        Module = "",
        Namespace = "",
        Macro = "",
        Class = "",
        Constructor = "",
        Field = "",
        Property = "",
        Method = "",
        Struct = "",
        Event = "",
        Interface = "",
        Enum = "",
        EnumMember = "",
        Constant = "",
        Function = "",
        TypeParameter = "",
        Variable = "",
        Operator = "",
        Null = "",
        Boolean = "蘒",
        Number = "",
        String = "",
        Key = "",
        Array = "",
        Object = "",
    },
}
