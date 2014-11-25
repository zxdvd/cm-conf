{% from "pip/map.jinja" import pip with context %}

python-pip:
  pkg.installed

{% for p in pip.pkgs %}
{{ p }}:
  pip.installed:
    - name: 
      - {{ p }}
    - require:
      - pkg: python-pip
{% endfor %}
