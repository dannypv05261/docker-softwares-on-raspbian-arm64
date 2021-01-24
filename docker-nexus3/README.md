# It is based on klo2k/nexus3 https://github.com/klo2k/nexus3-docker

# What I edit
For PI, it has very limited storage in the SD card. We usually need to mount a NAS driver or use SATA/SSD module to extend the storage.
With the original config, the nexus3 got many premission denied error after restarting the docker container.

To fix it:
1. mount the external storage with pi user
2. edit the Dockerfile to create the nexus user with pi user id 1000 & group id 1000
3. specified the user 1000:1000 in docker-compose.yml to run container with pi user