charliek_repo:
  pkgrepo.managed:
    - humanname: CharlieK Prod Repo
    - name: deb http://charliek-apt.s3-website-us-west-2.amazonaws.com trusty prod
    - dist: trusty
    - file: /etc/apt/sources.list.d/charliek.list
    - key_url: http://charliek-apt.s3-website-us-west-2.amazonaws.com/dists/pubkey.gpg

base_packages:
  pkg.installed:
    - pkgs:
      - vim
      - emacs
      - tree
      - curl
      - unzip
      - wget
      - ntp
      - htop
