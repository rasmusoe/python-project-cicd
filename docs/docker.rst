******
Docker
******

Docker is used for encapsulating all the tools used for developing on the
project. No detailed need for understanding og how Docker works is requied, but
more the know how to interact with Docker, if more in deepth Docker knowledge
is wanted, please see [1]_.

Docker commands used
====================

The following overview defines the different docker commands needed for
operating Docker on daily basis to work on the project. The commands used in
this section requires to be executed from the root of the project folder and
that docker desktop is installed on the machine and is up and running.

Before the container can be used it must be build. This action is only required
to be performed once, when done, the container is available on the local
machine even after a system restart.

.. code-block::

  docker-compose -f docker/docker-compose.yml build

This project uses the container in a detached mode and before it can be used,
and after it it has been build it must be started. The container must be
started each time the system (your PC) is booted.

.. code-block::

  docker-compose -f docker/docker-compose.yml up -d

At any time the status of the container can be checked. This will either give a
status if the container is up-and-running and ready to use, or if it isn't
running, it must be started. The status command can be issued at any time.

.. code-block::

  docker-compose -f docker/docker-compose.yml ps

The container can be used in two ways, the first one runs a command directly,
thats where the ``Makefile`` comes in handy, since it accepts a parameter and
the corresponding action is performed. The general form of using the container
diretly is with the command below.

.. code-block::

  docker-compose -f docker/docker-compose.yml exec python <command>

A complete command creating the documents you are reading right now, would look
like:

.. code-block::
  
  docker-compose -f docker/docker-compose.yml exec python make dev-docs


Lastly, the container can be used in interactive mode, meaning that you step
into the container and stay there until you exit, and all project related
commands can be called.

.. code-block::

  docker-compose -f docker/docker-compose.yml exec python sh -l


References
==========

.. [1] https://www.docker.com/
