# jetstream_setup
Generally useful scripts for initializing virtual machine (VM) environments in Jetstream (XSEDE). 

### Script descriptions: 

- `jetstream-playbook.yaml`: Sets up VM user access permissions, such as with Jetstream.
- `init_VM.sh`: Installs to VM useful packages & modules for extended bash functionality, HTML parsing, text analysis, and data management not available through the default Ubuntu 16.04 VM image on Jetstream.

- `charter-school-notebook-server`: Creates Jupyter notebook using custom port and datascience-notebook docker environment.
- `init_server.sh`: Installs to custom Jupyter notebook (via terminal) useful packages & modules for HTML parsing, text analysis, and data management not available through the default Ubuntu 16.04 VM image on Jetstream.

- `cron-kill-containers`: Automatically terminates all running Jupyter notebook servers at 5 AM. This avoids excessive drain on system resources by terminating team members' not-actively-used notebook servers, which otherwise may consume GB of memory in background.
- `kill-charter-school-containers`: Executes above. 

For more information on configuring a VM environment with tools like these, contact jhaber@berkeley.edu.

Kudos to aculich for his code contributions!



