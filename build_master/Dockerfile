FROM buildbot/buildbot-master:master
#FROM buildbot/buildbot-master:2.8.x
COPY master.cfg /usr/src/buildbot/docker/
COPY master.cfg /var/lib/buildbot
WORKDIR /var/lib/buildbot
CMD ["dumb-init", "/usr/src/buildbot/docker/start_buildbot.sh"]
