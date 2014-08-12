sudo-group:
  group.present:
    - name: sudo
    - system: True

sudo:
  pkg.installed:
      - group: sudo-group
      - file: /etc/sudoers

/etc/sudoers:
  file.managed:
    - user: root
    - group: root
    - mode: 440
    - template: jinja
    - source: salt://users/sudoers.jinja
    - require:
      - pkg: sudo
