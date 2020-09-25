# lovejoi_infra


Была созданна директория packer в которой есть фаил с описанием для сбора образа ubuntu , скрипты находятся в папке scripts 
а переменные в фаиле variables 

------------------------------------------

testapp_IP = 84.201.135.79
testapp_port = 9292


yc compute instance create \
  --name reddit-app \
  --hostname reddit-app \
  --memory=4 \
  --create-boot-disk image-folder-id=standard-images,image-family=ubuntu-1604-lts,size=10GB \
  --network-interface subnet-name=default-ru-central1-a,nat-ip-version=ipv4 \
  --metadata serial-port-enable=1 \
  --metadata-from-file user-data=./metadata.yaml

--------------------
lovejoi Infra repository
bastion_IP = 84.201.145.123 
someinternalhost_IP = 10.128.0.3

1)Для подключения к someinternalhost одной командой надо создать фаил в .ssh/config и внем команду 
Host someinternalhost 
    User appuser	
    IdentityFile ~/.ssh/appuser
    ProxyCommand ssh -A appuser@84.201.145.123 -W %h:%p

2)для подключения по hostname в дополнение к предыдущей команде надо еще добавить запись в /etc/hosts виде: IP_Addr_host someinternalhost
