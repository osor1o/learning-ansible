printf "\n\033[0;44m---> Starting docker-compose.yml.\033[0m\n"
sudo docker-compose up -d

printf "\n\033[0;44m---> Checking ansible syntax.\033[0m\n"
ansible-playbook -i ansible/hosts -l linux_server -u main -k -b ansible/playbook.yml --syntax-check

printf "\n\033[0;44m---> Starting ansible.\033[0m\n"
ansible-playbook -i ansible/hosts -l linux_server -u main -k -b ansible/playbook.yml
