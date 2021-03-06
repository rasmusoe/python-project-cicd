# Readme

This readme outlines how to build this example Python project and access the
detailed documentation by following the steps below.

1. Assuming you are running Windows, install [Docker-desktop](https://www.docker.com/products/docker-desktop)
2. Enable Linux containers
3. Enter a powershell command line and the root of this Python folder project
4. Run the docker build command:
    ```text
    docker-compose -f docker/docker-compose.yml build
    ```
5. Run the docker up command:
    ```text
    docker-compose -f docker/docker-compose.yml up -d
    ```
6. Run the make all and wait until completion!
    ```text
    docker-compose -f docker/docker-compose.yml exec python make all
    ```
7. Enter the ``docs/_build`` directory and open the ``index.html`` file and
   read the detailed documentation
