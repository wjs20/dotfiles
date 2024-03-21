return {
        s("rule", fmt([[
rule {rule_name}:
    input:
        "{input}"
    output:
        "{output}"
    shell:
        "{shell}"
{}
        ]], {
            rule_name = i(1, "rule_name"),
            input = i(2, "input"),
            output = i(3, "output"),
            shell = i(4, "shell"),
            i(0),
        }, {
            repeat_duplicates = true
        }))
}
