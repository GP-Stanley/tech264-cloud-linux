```yaml
  GNU nano 6.2                                                                                                                                                                                                                                                                                                                                                                                      prov-db.yml
---
# Playbook to install and configure MongoDB on the database VM
- name: Provision MongoDB on database VM
  hosts: db
  gather_facts: yes
  become: true

  tasks:

    # Import the MongoDB public key
    - name: Import the MongoDB public key
      ansible.builtin.apt_key:
        url: https://www.mongodb.org/static/pgp/server-7.0.asc
        state: present

    # Add the MongoDB repository
    - name: Add the MongoDB repository
      ansible.builtin.apt_repository:
        repo: "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu {{ ansible_distribution_release }}/mongodb-org/7.0 multiverse"
        state: present
        update_cache: yes

    # Install MongoDB 7.0.6
    - name: Install MongoDB 7.0.6
      ansible.builtin.apt:
        name: mongodb-org=7.0.6
        state: present
        update_cache: yes

    # Ensure the MongoDB data directory exists with proper permissions
    - name: Ensure MongoDB data directory exists
      ansible.builtin.file:
        path: /var/lib/mongodb
        state: directory
        owner: mongodb
        group: mongodb
        mode: '0755'

    # modify MongoDB configuration to allow remote connections
    - name: Configure MongoDB to allow remote connections
      ansible.builtin.lineinfile:
        path: /etc/mongod.conf
        regexp: '^  bindIp:.*'
        line: '  bindIp: 0.0.0.0'
        state: present

    # Start and enable MongoDB service
    - name: Start and enable MongoDB service
      ansible.builtin.service:
        name: mongod
        state: started
        enabled: yes

  handlers:
    - name: restart mongod
      ansible.builtin.service:
        name: mongod
        state: restarted

    # Set DB_HOST environment variable on the app VM
    - name: Set DB_HOST environment variable
      ansible.builtin.lineinfile:
        path: /etc/environment
        line: 'DB_HOST=mongodb://172.31.19.24:27017/posts'
        state: present

    # Restart the app
    - name: Restart the app
      ansible.builtin.shell:
        cmd: npm start
        chdir: /home/ubuntu/app/app
      become: true

    # Seed the database
    - name: Seed the MongoDB database
      ansible.builtin.command:
        cmd: node seeds/seed.js
      args:
        chdir: /home/{{ ansible_user }}/app/seeds/seed.js
```