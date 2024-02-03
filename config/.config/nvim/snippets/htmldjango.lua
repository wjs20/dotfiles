return {
        s("block", fmt([[
            {{% block {blockname} %}}
            {}
            {{% endblock {blockname} %}}
        ]], {
            blockname = i(1, "blockname"),
            i(0),
        }, {
            repeat_duplicates = true
        }))
}
