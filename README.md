## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

![alt text](https://github.com/JoshuaLennox/CybersecWeek13HW/blob/main/Images/Network_Diagram.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the yml and config files may be used to install only certain pieces of it, such as Filebeat.

[Ansible/ansible.cfg](https://github.com/JoshuaLennox/CybersecWeek13HW/blob/fd7cb918307ff2691660044a49d951de86bf51d2/Ansible/ansible.cfg)
[https://github.com/JoshuaLennox/CybersecWeek13HW/blob/1fb514d9c5db790a8528616a97fa41504d79c14b/Ansible/hosts ](https://github.com/JoshuaLennox/CybersecWeek13HW/blob/1fb514d9c5db790a8528616a97fa41504d79c14b/Ansible/hosts)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build

### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly avaliable, in addition to restricting access to the network.
- Load balancers protect the avaliability of a network by distributing traffic across web servers and also has the ability to restrict access to the network.  
- A jump box provides a centralised point for admin rollout into a network. Its a hardened and monitored machine that provides another secure layer between external and internal assets.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the logs and system traffic.
- Filebeat monitors log files and forwards them to either Elasticsearch or Logstash for indexing.
- Metricbeat collects metrics from the operating system and the services running on the server. It then forwards the metrics to Elasticsearch or Logstash.

The configuration details of each machine may be found below.

| Name       | Function   | IP Address | Operating System |
|------------|------------|------------|------------------|
| Jump Box   | Gateway    | 10.0.0.4   | Linux            |
| Web 1      | Server     | 10.0.0.5   | Linux            |
| Web 2      | Server     | 10.0.0.6   | Linux            |
| Elk Server | Log Server | 10.1.0.4   | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the Jump box provisioner machine can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses: 
Personal IP address - 141.168.36.131

Machines within the network can only be accessed by Jump Box.
-The Elk Server can be accessed from 141.168.36.131 through port 5601.

A summary of the access policies in place can be found in the table below.

| Name          | Publicly Accessible | Allowed IP Addresses |
|---------------|---------------------|----------------------|
| Jump Box      | Yes                 | 141.168.36.131       |
| Load Balancer | Yes                 | Open                 |
| Web 1         | No                  | 10.0.0.5             |
| Web 2         | No                  | 10.1.0.6             |
| Elk Server    | Yes                 | 141.168.36.131       |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because...
- The entire process was streamlined and setup to a minimum standard of operating. This allows for easy scalability and management. It also removes human error in the setup of each new machine

The playbook implements the following tasks:
- Installs docker.io
- Increases virtual memory
- Downloads and Launch a docker elk container

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

![alt text](https://github.com/JoshuaLennox/CybersecWeek13HW/blob/main/Images/dockerpsoutput.png?raw=true)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
- Web 1 - 10.0.0.5
- Web 2 - 10.0.0.6

We have installed the following Beats on these machines:
- Filebeat
- Metricbeat (Optional - Completed)

These Beats allow us to collect the following information from each machine:
- Filebeat - Quote "Filebeat is a lightweight shipper for forwarding and centralizing log data. Installed as an agent on your servers, Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing."
   - MySQL, Microsoft Azure web server logs, Apache.
- Metricbeat - Quote "Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash. Metricbeat helps you monitor your servers by collecting metrics from the system and services running on the server, such as: Apache."
   - Machine statistics logs, Network statistics logs

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the Filebeat and Metricbeat yml configuration files to /etc/ansible/files.
- Update the ansible hosts file to include Web1, Web2 and Elk Server IP addresses.
- Run the playbooks in /etc/ansible/roles with the `ansible-playbook filebeat-playbook.yml` and `ansible-playbook metricbeat-playbook.yml` commands, and navigate to http://(Elk-VM public IP):5601/app/kibana to check that the installation worked as expected.

Answer the following questions to fill in the blanks:_
- Which file is the playbook? filebeat-playbook.yml, metricbeat-playbook.yml, install-elk.yml 
- Where do you copy it? Copied to /etc/ansible/roles for Filebeat and Metricbeat, and /etc/ansible for install-elk
- Which file do you update to make Ansible run the playbook on a specific machine? /etc/ansible/hosts file. We used the [Webservers] section. How do I specify which machine to install the ELK server on versus which to install Filebeat on? Added an additional zone called [Elk] with the Elk-VM IP address specified. In the playbooks, the `hosts:` section was specified as elk
- Which URL do you navigate to in order to check that the ELK server is running? http://(Elk-VM public IP):5601/app/kibana
 
Specific commands the user will need to run to download the playbook, update the files (Commands needed to setup up a new VM)

| Command:                                      | Outcome:                                                                 |
|-----------------------------------------------|--------------------------------------------------------------------------|
| curl -L -O [url of file]                      | Command to download the files off the web                                |
| nano /etc/ansible/hosts                       | Open and edit the hosts files to enter new VM internal IP's for updating |
| nano /etc/ansible/ansible.cfg                 | To configure the ansible.cfg file                                        |
| nano /etc/ansible/files/filebeat-config.yml   | To update the filebeat config file                                       |
| nano /etc/ansible/files/metricbeat-config.yml | To update the metricbeat config file                                     |
| ansible-playbook [location][filename]         | To run the playbook                                                      |
