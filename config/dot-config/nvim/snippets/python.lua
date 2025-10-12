
function collect_instance_attrs(argnode_text, parent)
    local instance_attrs = argnode_text[1][1]
    if not string.find(instance_attrs, ",") then
        return "self." .. instance_attrs .. " = " .. instance_attrs
    end
    local attributes = {}
    for value in string.gmatch(instance_attrs, "([^,]+)") do
        value = string.gsub(value, "^%s*(.-)%s*$", "%1") -- Trim whitespace
        table.insert(attributes, 'self.' .. value .. ' = ' .. value)
    end
    return attributes
end

return {
    s("tcview", fmt([[
    class {}Test(TestCase):
        @classmethod
        def setUpTestData(cls):
            # Create objects
            {}

        def setUp(self):
            self.user = UserFactory()
            self.client.force_login(self.user)
            {}

        def test_view_url_accessible_by_name(self):
            response = self.client.get(reverse('{}'))
            self.assertEqual(response.status_code, 200)
            {}

    ]], {
       i(1),
       i(2),
       i(3),
       i(4),
       i(0),
    })),
    s("nullcheck", fmt([[
    if {} is None:
        {}
    ]], {
        i(1),
        i(0)
    })),
    s("myclass", fmt([[
    class {}:
        def __init__(self, {}):
            {}

        {}
    ]], {
       i(1, "ClassName"),
       i(2, "args", {key = "args-key"}),
       isn(nil, { f(collect_instance_attrs, k("args-key") ) }, "$PARENT_INDENT\t\t"),
       i(0),
    }))
}
