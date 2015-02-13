{% from "general/map.jinja" import pkgs with context %}

# general packages to be installed
{% for pkg in pkgs.pkgs %}
{{ pkg }}:
  pkg.installed
{% endfor %}

#my dotfile repository
git-confs:
  git.latest:
    - name: https://github.com/zxdvd/confs.git
    - target: /home/zxd/git/confs
    - user: zxd
    - require:
      - pkg: git

{% for f in pkgs.confs %}
/home/zxd/{{ f }}:
  file.copy:
    - source: ///home/zxd/git/confs/dotfiles/{{ f }}
    - user: zxd
    - force: True
    - onchanges:
      - git: git-confs
{% endfor %}

{% for f in pkgs.confs %}
/root/{{ f }}:
  file.copy:
    - source: ///home/zxd/git/confs/dotfiles/{{ f }}
    - user: root
    - force: True
    - onchanges:
      - git: git-confs
{% endfor %}
