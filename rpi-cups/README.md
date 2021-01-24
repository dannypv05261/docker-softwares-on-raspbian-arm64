# What I edit
For cups in arm64, most of the docker images based on ubuntu which has larger size than the software itself.
And some config is missing so as to support USB printer.
Also, I can't find one image which can add the HTTP access rule to cups and change the login account & password.

1. Use alpine:3.12.3 to replace ubuntu (Very small)
2. Add "privileged: true" to find the USB printer
3. Add HTTP access rule at the first time of boot in start.sh
4. Setup user password in start.sh for alpine (alpine cannot set password in Dockerfile)
5. The entrypoint is "startup.sh" in Dockerfile
