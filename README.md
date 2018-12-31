﻿# gryaznovart186_infra
gryaznovart186 Infra repository
Знакомство с облачной инфраструктурой и облачными сервисами

## ДЗ №5 Знакомство с облачной инфраструктурой и облачными сервисами
35.211.107.104 - Внешний ip для bastion
10.142.0.3:22 - Внутрений ip для someinternalhost
username - уз для которой созданы ssh ключи
##### Подключения в одну строку
Помимо действий описаных в ДЗ, для подключения к серверу в одну команду необходимо добавить ключь t(проброс псевдотерминала):
    ssh -i ~/.ssh/id_rsa -tA username@35.211.107.104 ssh 10.142.0.3
##### Подключение по ssh c alias
Для подключения по ssh с помошью команды ssh someinternalhost необходимо в ~/.ssh создать файл config с содержимым:
```
Host bastion
    HostName 35.211.107.104
    User username
```
```
Host someinternalhost
    ProxyCommand ssh -A bastion -W 10.142.0.3:22
    User username
```
##### Для подключения  к VPN

bastion_IP = 35.211.107.104
someinternalhost_IP = 10.142.0.3

## ДЗ №6 Знакомство с облачнойинфраструктурой. GoogleCloud Platform

testapp_IP = 35.243.159.81
testapp_port = 9292
