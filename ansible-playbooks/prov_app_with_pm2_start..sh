```yaml
  GNU nano 6.2                                                                                                                                                                                                                                                                                                                                                                              prov_app_with_npm_start.yml
---
- name: prov_app_with_npm_start.yml
  hosts: web
  gather_facts: yes
  become: true

  vars:
    app_source_path: "/home/{{ ansible_user }}/app"
    app_dest_path: "/home/{{ ansible_user }}/app/app"

  tasks:

    # Add the GPG key for the NodeSource repository
    - name: Install curl (required to add NodeSource repository)
      ansible.builtin.apt:
        update_cache: yes
        name: curl
        state: present

    - name: Add NodeSource repository for Node.js 20
      ansible.builtin.shell:
        curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -

    # Install Node.js on the target node
    - name: Install Node.js on the target node
      ansible.builtin.package:
        name: nodejs
        state: present

    # Set DB_HOST environment variable (persistent)
    - name: Set DB_HOST environment variable
      ansible.builtin.lineinfile:
        path: /etc/environment
        line: 'DB_HOST=mongodb://172.31.19.24:27017/posts'
        state: present


    # Install pm2 globally
    - name: Install PM2 globally
      ansible.builtin.npm:
        name: pm2
        global: true
        state: present

    # Clone the app repository to the control node
    - name: Clone the app repository to the control node
      delegate_to: localhost
      ansible.builtin.git:
        repo: 'https://github.com/GP-Stanley/tech264-sparta-app'
        dest: "{{ app_source_path }}"
        version: main
      tags: clone_app

    # Copy app folder to the target node
    - name: Copy app folder to target node
      ansible.builtin.copy:
        src: "{{ app_source_path }}/"
        dest: "{{ app_dest_path }}"
        mode: '0755'
      tags: copy_app

    # Install npm dependencies within the app folder
    - name: Install npm dependencies in the app folder
      community.general.npm:
        path: "{{ app_dest_path }}"
      tags: install_dependencies

    # Stop pm2 processes
    - name: Stop all processes running on pm2
      ansible.builtin.shell:
        cmd: pm2 stop all
        chdir: "{{ app_dest_path }}"
      ignore_errors: yes
      tags: pm2_stop

    # Start the node.js app with PM2
    - name: Start the node.js app
      ansible.builtin.shell:
        cmd: pm2 start app.js --update-env
        chdir: "{{ app_dest_path }}"
      environment:
        DB_HOST: "mongodb://172.31.19.24:27017/posts"
      tags: pm2_start
```


ONCE REMOVED FROM DATABASE PLAYBOOK, PUT THIS CODE AT THE END OF THIS (APP) PLAYBOOK.


```yaml
   # Seed the database
    - name: Seed the MongoDB database
      ansible.builtin.command:
        cmd: node seeds/seed.js
      args:
        chdir: "{{ app_dest_path }}"
```
