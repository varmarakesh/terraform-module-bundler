from setuptools import setup, find_packages
from codecs import open
from os import path

__version__ = '0.0.1'

here = path.abspath(path.dirname(__file__))

# Get the long description from the README file
with open(path.join(here, 'README.md'), encoding='utf-8') as f:
    long_description = f.read()

# get the dependencies and installs

all_reqs = [
    'colorlog==4.0.2'
]
install_requires = [x.strip() for x in all_reqs if 'git+' not in x]
dependency_links = [x.strip().replace('git+', '') for x in all_reqs if x.startswith('git+')]

setup(
    name='terraform-module-bundler',
    version=__version__,
    description='terraform-module-bundler allows you to create lean packages of terrafom modules source code.',
    long_description=long_description,
    long_description_content_type='text/markdown',
    license='BSD',
    classifiers=[
        'Development Status :: 5 - Production/Stable',
        'Intended Audience :: Developers',
        'Operating System :: MacOS :: MacOS X',
        'Operating System :: Microsoft :: Windows',
        'Operating System :: POSIX :: Linux',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: Implementation :: CPython'
    ],
    keywords='',
    packages=find_packages(exclude=['docs', 'tests*', '.idea']),
    include_package_data=True,
    author='Rakesh V',
    install_requires=install_requires,
    dependency_links=dependency_links,
    author_email='varma.rakesh@gmail.com',
    url='https://github.com/varmarakesh/terraform-module-bundler',
    entry_points={
        'console_scripts': [
            # We use this line to map our `main()` method
            'terraform-module-bundler = terraform_module_bundler.main:main'
        ]
    }
)