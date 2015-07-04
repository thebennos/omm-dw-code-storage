FROM progrium/busybox
MAINTAINER Benjamin Wenderoth <b.wenderoth@gmail.com>

RUN opkg-install curl
RUN mkdir /srv && cd /srv && curl http://ftp.drupal.org/files/projects/drupal-7.34.tar.gz > drupal.tar.gz && gzip -d *.gz && tar xf *.tar && rm *.tar && mv drupal* website
RUN rm -r /srv/website/sites && ln -s /srv/sites /srv/website/sites

VOLUME /srv/website

CMD ["/bin/sh"]
