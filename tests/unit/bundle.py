from terraform_module_bundler.bundle import Bundle, BadDirectoryException
import unittest
import glob
import os


class BundleTests(unittest.TestCase):

    def setUp(self):
        pass

    def test_bundle_zip_valid_directory_path(self):
        bundle = Bundle(
            directory_path='tests/unit/fixtures/module-1'
        )
        zip_file = bundle.zip()
        self.assertEqual(
            len(bundle.info(zip_file=zip_file)),
            5
        )

    def test_bundle_zip_no_directory_path(self):
        bundle = Bundle()
        zip_file = bundle.zip()
        self.assertEqual(
            len(bundle.info(zip_file=zip_file)),
            0
        )

    def test_bundle_zip_bad_directory_path(self):
        with self.assertRaises(BadDirectoryException):
            bundle = Bundle(
                directory_path='tests/unit/fixtures/module-2'
            )
            bundle.zip()

    def tearDown(self):
        # Cleanup generated zip files.
        for file in glob.glob('*.zip'):
            os.remove(file)
