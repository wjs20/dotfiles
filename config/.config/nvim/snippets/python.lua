return {
    s("djtest", fmt([[
        class {test_name}TestCase(TestCase):
            @classmethod
            def setUpTestData(cls):
                """setUpTestData: Run once to set up non-modified data for all class methods."""
                {test_class_setup}

            def setUp(self):
                """setUp: Run once for every test method to set up clean data."""
                {test_method_setup}

            def test_one_plus_one_equals_two(self):
                """Method: test_one_plus_one_equals_two."""
                {}self.assertEqual(1 + 1, 2)
    ]], {
       i(0),
       test_name = i(1, "test_name"),
       test_class_setup = i(2, "pass"),
       test_method_setup = i(3, "pass"),
    })),
}
