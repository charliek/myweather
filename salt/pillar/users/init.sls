# see https://github.com/saltstack-formulas/users-formula/blob/master/pillar.example

users:
  charliek:
    fullname: Charlie Knudsen
    sudouser: True
    sudo_rules:
      - "ALL=NOPASSWD: ALL"
    shell: /bin/bash
    groups:
      - sudo
      - adm
    ssh_auth:
      # Work Key
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYKEWiq6dvqDsAV3ZGrmXiF111YpEcsHOWaVvZE7LBQvZgyIUktOcXBpK2+T1pRpcIdXVVIUULYB+7xJCsiSCPh6QFFZ5qJMgHi9BHtS4W4YYfHoz6lIVZKg6MnZM1kcDzcRCOODHEnADBUyT+2ZewHj02yfiF8lKAkHZhkH0C1qiWrozsIPP8H71zpdFwKkDyDLXIAU0na8USdZX/4kMI362lsUIaHMZcbWrmHoYbA7zjJyPsh2zQCkNEXYoTnh1qWkglk3eG+ffsZ7Xk4DXyD7LFpQ0uAavOs+mNPCnZmCRznu8HCb7rKbJqSn8v1bBAHiAvW9uEkTp69QshHuCx cknudsen@bloomhealthco.com

  cknudsen:
    fullname: Charlie Knudsen
    sudouser: True
    sudo_rules:
      - "ALL=NOPASSWD: ALL"
    shell: /bin/bash
    groups:
      - sudo
      - adm
    ssh_auth:
      # Work Key
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDYKEWiq6dvqDsAV3ZGrmXiF111YpEcsHOWaVvZE7LBQvZgyIUktOcXBpK2+T1pRpcIdXVVIUULYB+7xJCsiSCPh6QFFZ5qJMgHi9BHtS4W4YYfHoz6lIVZKg6MnZM1kcDzcRCOODHEnADBUyT+2ZewHj02yfiF8lKAkHZhkH0C1qiWrozsIPP8H71zpdFwKkDyDLXIAU0na8USdZX/4kMI362lsUIaHMZcbWrmHoYbA7zjJyPsh2zQCkNEXYoTnh1qWkglk3eG+ffsZ7Xk4DXyD7LFpQ0uAavOs+mNPCnZmCRznu8HCb7rKbJqSn8v1bBAHiAvW9uEkTp69QshHuCx cknudsen@bloomhealthco.com

  rundeck:
    fullname: Rundeck Server
    sudouser: True
    sudo_rules:
      - "ALL=NOPASSWD: ALL"
    shell: /bin/bash
    groups:
      - sudo
      - adm
    ssh_auth:
      - ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC8nZ6c3m6sqVo36OlKPBoFU3SOO/ToEAJ0Ge4BhfzlPoWvIIrysUuvLrBgBn4pKBdN7NqYrUswsL8+ZzCgQ36+lHMPmfUU68p3XDjCu1TGXXJvmHWPMXp8NeZWNERA5l5jSEq2ROcdME/r4TIl421wwIEoJVtswi3SOrRykqgychKosg1jGklrP+cfCRtzVCBiKxAfLxObkmsh/yAa+u8GcQq8H6mObQV0jCGQGByjEqePdlxVdcRi26akZPxoWHxgz/xCe3ZLaB9e7R9B6h3TV+PRuXLPissetZGKFDh3p3CicX2U2jcXZikooXBAdNcmZRS76wqGD6X87cYZZfJZ root@rundeck02
