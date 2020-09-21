# lovejoi_infra

testapp_IP = 84.201.135.79
testapp_port = 9292

lovejoi Infra repository
bastion_IP = 84.201.145.123 
someinternalhost_IP = 10.128.0.3

1)Для подключения к someinternalhost одной командой надо создать фаил в .ssh/config и внем команду 
Host someinternalhost 
    User appuser	
    IdentityFile ~/.ssh/appuser
    ProxyCommand ssh -A appuser@84.201.145.123 -W %h:%p

2)для подключения по hostname в дополнение к предыдущей команде надо еще добавить запись в /etc/hosts виде: IP_Addr_host someinternalhost
