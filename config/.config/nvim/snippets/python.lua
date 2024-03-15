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
    }))

}
