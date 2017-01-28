# Gentoo overlay
## Layman usage
```bash
# install
layman -o https://raw.githubusercontent.com/lexa-uw/gentoo-overlay/master/layman.xml -f -a lexa-uw
# update
layman -s lexa-uw
```

## repos.conf usage
```bash
# add config
cat <<'EOF' > /etc/portage/repos.conf/lexa-uw.conf
[lexa-uw]
priority = 50
location = /var/www/applications/my/gentoo-overlay
sync-type = git
sync-uri = https://github.com/lexa-uw/gentoo-overlay.git
auto-sync = Yes
EOF
# update repo
emaint sync -r lexa-uw
```

## Packages
- app-benchmarks/jmeter-bin (2.9, 2.10, 2.13, 3.1)
- app-misc/phantom (9999_p20160919)
- dev-php/pecl-gearman (1.1.2, 2.0.1, 2.0.2, 2.0.3)
- dev-php/pecl-inotify (0.1.6, 2.0.0)
- dev-php/pecl-protobuf (3.1.0_alpha)
- pecl-protocolbuffers (0.2.6)
- dev-php/tideways (9999_p20170116)
- media-libs/gst-plugins-bad (1.6.3, 1.8.3-r1)
