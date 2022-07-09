ARG GENTOO_VER
# name the portage image
FROM gentoo/portage:$GENTOO_VER as portage

# based on stage3 image
FROM gentoo/stage3:$GENTOO_VER

# copy the entire portage volume in
COPY --from=portage /var/db/repos/gentoo /var/db/repos/gentoo

# !!! It seems /run is not mounted. Process management may malfunction.
RUN emerge -qv app-portage/eix dev-vcs/subversion

#TODO: merge with previous one RUN
RUN mkdir /var/mail

RUN localedef -i en_US -f UTF-8 en_US.UTF-8

# Accept id through --build-arg and create newit user matching current logon user ID
# -m for creating home dir
ARG uid
RUN useradd -l --uid=$uid newit
USER newit

ENV LC_CTYPE=en_US.UTF-8
