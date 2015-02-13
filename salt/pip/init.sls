{% from "pip/map.jinja" import pip2, pip3 with context %}

get-pip:
  cmd.run:
    - name: curl https://bootstrap.pypa.io/get-pip.py | /usr/bin/python
    - unless: which pip
     

{% for p in pip2.pkgs %}
{{ p }}:
  pip.installed:
    - name: 
      - {{ p }}
    - bin_env: {{ pip2.pip2 }}
    - onlyif:
      - ls /usr/bin/python2
{% endfor %}

{% for p in pip3.pkgs %}
{{ p }}:
  pip.installed:
    - name: 
      - {{ p }}
    - bin_env: {{ pip3.pip3 }}
    - onlyif:
      - ls /usr/bin/python3
{% endfor %}
