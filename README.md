terraform-module-bundler
==

`terraform-module-bundler` is a helper tool used to a create a lean bundle of your terraform module code that you be shipped to artifact repository of your choice 
(eg: s3 bucket , artifactory)

Background
--

If you are working on using terraform for your infrastructure as code, mostly you would have worked on creating modules.
Modules help you to organize your code and promote re-usability. 

Terraform allows various options for module sources such as git repositories, local file paths, archives from s3 bucket or http based repositories.

For more information, [click here](https://www.terraform.io/docs/modules/sources.html)

Goals
--

The purpose of this tool is to make it very easy to.

* Create lean module package (not include files such as readme.md, .git, editor files, etc).
* Support different formats (.zip is the most common one, but terraform also supports .tar.gz, .tar.bz2)

Usage
--

```json
pip install terraform-module-bundler
```

In your module, directory simply run

```json
terraform-module-bundler bundle
```

Or you can specify a directory path

```json
terraform-module-bundler bundle --directory_path=/path/to/your/terraform-module/
```