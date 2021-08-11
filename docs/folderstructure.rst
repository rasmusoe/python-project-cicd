****************
Folder structure
****************

The main reason for having a standardized way of creating a project structure
is to have a well defined development environment, which includes a default
toolchain which includes common tools to aid in developing and releasing
software. The standardized structure also gives everyone a familiar look when
maintaining old code and onboarding new developers into a an existing project.

The standadized project layout also helps with having default tools enabled
within the project, and especially for Python where the toolchain may become
complex beacuse of the different tools and different usage scenarios og setup
configurations available, ensures that quality and build output is
deterministic during the development phase and that automation can be
build into the delevopment flow through a CI/CD workflow.

Some of the topics mentioned in this section will be described in detail in the
technology chapter without further details in this section.

.. code::

   ../
   ├── .vscode/
   ├── configurations/
   ├── docker/
   ├── docs/
   ├── requirements/
   ├── src/
   ├── tests/
   ├── .dockerignore
   ├── .editorconfig
   ├── .gitattributes
   ├── .gitignore
   ├── CHANGELOG.md
   ├── LICENSE
   ├── Makefile
   ├── MANIFEST.in
   ├── pyproject.toml
   ├── README.md
   ├── requirements.txt
   ├── setup.cfg
   ├── setup.py
   └── tox.ini


The following directories are present and should be maintained for further
CI/CD integration, they are described in detail further below:

* ``.vscode`` files used for vscode integration
* ``configurations`` contains different configuration files used by different
  lint tools
* ``docker`` contains all docker related files
* ``docs`` contains all documentation related to software package being
  developed
* ``requirements`` contains requiremnts used for different linters, tests etc.
* ``src`` contains source code for the software package
* ``tests`` contains all the test code for testing the source code within the
  ``src`` directory

The following files are present within the root of the workspace, and they
should remain here for further CI/CD integration:

* ``.dockerignore`` used for docker ignore rules and exceptions
* ``.editorconfig`` ruleset for editorsetup used by VSCode
  (https://editorconfig.org/)
* ``.gitattributes`` used for customizing Git usage for this workspace
* ``.gitignore`` contains files to be ignored by Git
* ``CHANGELOG.md`` contains information about project changes
* ``LICENSE`` license file
* ``Makefile`` entry point for automating build process etc.
* ``pyproject.toml`` defines build system requirements etc.
* ``README.md`` this readme file
* ``requirements.txt`` requirements file for software package being developed
* ``setup.cfg`` setup configuration file for build software package. This files
  contains the package requirements for the software package
* ``setup.py`` setup script used during the build process of the software
  package
* ``tox.ini`` configuration file for tox

Subfolder contents
==================

.vscode
-------

The ``.vscode`` folder contains helper files when using VSCode as editor.

* ``settings.json`` this is a general settings file
* ``tasks.json`` this file defines the tasks that can be run directly from
  VSCodes task menu. The tasks maps directly to entries within the
  ``Makefile``.

configurations
--------------

Contains different configuration files used by different type checking tools.
The naming of the files relates directly to the tool they control the settings
for. By default, the settings used for the tools are appropriate for normal
development and it should tehrefor not be necessay to adjust the settings
in the files.

* ``.flake8`` used by flake8
* ``.pydocstyle`` used by pydocstyle
* ``.pylintrc`` used by pylint

docker
------

Conatins all docker related files for creating and using a Docker container.

* ``.env`` environment file for the Docker session
* ``docker-compose.yml`` general settings for the Docker container, this is
  easier to have the configuration maintained in a file rather then give them as
  parameters to Docker when starting the container 
* ``Dockerfile`` the build description for the Docker container

The ``.env`` contains a definition for the parent name of the docker
container. The definition must be updated to match the project name in order to
uniquely identify the docker container within the local docker repository when
working with multiple docker containers active at the same time.

docs
----

All document related files reside in this directory. The output from ``sphinx``
will be placed in this dorectory along the documenttaion written by the
developer. The documentation should be written in restructured text format.

requirements
------------

This folder contains all the requirements for building the software package and
run all development activities for testing and documenting the software
package.

src
---

Contains all the source code. The fodler structure follows the pattern by
having the main folder named after the project and as a minimum having the
following files present:

* ``__init__.py``
* ``__main__.py``
* ``cli.py``
* ``version.py`` contains the current version of the software package, it must
  be updated manually when a new version is being build

The reason for having ``__main__.py`` and considered best practice can be found
here: https://docs.python.org/3/using/cmdline.html#cmdoption-m

tests
-----

Contains test code that performs test on the code base located in the ``src``
folder. Test code may be stored within a folder hierarchy if it helps maintain
a good overview and encapsulate related test code.
