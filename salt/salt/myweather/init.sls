myweather:
  pkg.installed:
    - version: 0.0.1
    - refresh: True
  service.running:
    - enable: True
    - watch:
      - pkg: myweather
      - file: /etc/myweather.conf

/etc/myweather.conf:
  file.managed:
    - source: salt://myweather/myweather.conf
    - template: jinja
    - require:
      - pkg: myweather
