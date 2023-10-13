1.1 Création des partitions

``` bash
root@SRVDEBIAN:~# fdisk /dev/sdb
Bienvenue dans fdisk (util-linux 2.38.1).
Les modifications resteront en mémoire jusqu'à écriture.
Soyez prudent avant d'utiliser la commande d'écriture.

Le périphérique ne contient pas de table de partitions reconnue.
Created a new DOS (MBR) disklabel with disk identifier 0xc5fe25ec.

Commande (m pour l'aide) : n
Type de partition
   p   primaire (0 primaire, 0 étendue, 4 libre)
   e   étendue (conteneur pour partitions logiques)
Sélectionnez (p par défaut) : p
Numéro de partition (1-4, 1 par défaut) :
Premier secteur (2048-20971519, 2048 par défaut) :
Dernier secteur, +/-secteurs ou +/-taille{K,M,G,T,P} (2048-20971519, 20971519 par défaut) : +6G

Une nouvelle partition 1 de type « Linux » et de taille 6 GiB a été créée.

Commande (m pour l'aide) : n
Type de partition
   p   primaire (1 primaire, 0 étendue, 3 libre)
   e   étendue (conteneur pour partitions logiques)
Sélectionnez (p par défaut) : p
Numéro de partition (2-4, 2 par défaut) :
Premier secteur (12584960-20971519, 12584960 par défaut) :
Dernier secteur, +/-secteurs ou +/-taille{K,M,G,T,P} (12584960-20971519, 20971519 par défaut) :

Une nouvelle partition 2 de type « Linux » et de taille 4 GiB a été créée.
Commande (m pour l'aide) : t
Numéro de partition (1,2, 2 par défaut) : 2
Code Hexa ou synonyme (taper L pour afficher tous les codes) :82

Type de partition « Linux » modifié en « Linux swap / Solaris ».

Commande (m pour l'aide) : w
La table de partitions a été altérée.

root@SRVDEBIAN:~#  mkfs.ext4 -L "DATA" /dev/sdb1
mke2fs 1.47.0 (5-Feb-2023)
Creating filesystem with 1572864 4k blocks and 393216 inodes
Filesystem UUID: 939afd47-77e7-408b-91d0-2f1cd19bfd17
Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736

Allocating group tables: done
Writing inode tables: done
Creating journal (16384 blocks): done
Writing superblocks and filesystem accounting information: done

root@SRVDEBIAN:~# swapoff /dev/sda5
root@SRVDEBIAN:~# swapon /dev/sdb2
root@SRVDEBIAN:~# lsblk -f
NAME   FSTYPE FSVER LABEL UUID                                 FSAVAIL FSUSE% MOUNTPOINTS
sda
├─sda1 ext4   1.0         c0a3c695-9fc2-4b3c-898a-a37b0a1c821e   19,4G     6% /
├─sda2
└─sda5 swap   1           c38d85be-1c7a-427c-8be8-a78483a16bb1
sdb
├─sdb1 ext4   1.0   DATA  b9ed0b1d-b40f-46a3-95c8-dc84b84418bc
└─sdb2 swap   1     SWAP  3a82d6c0-9235-4e2f-b884-692e70230252                [SWAP]


```

1.2 Montage automatique de la partition SDB1

``` bash
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# systemd generates mount units based on this file, see systemd.mount(5).
# Please run 'systemctl daemon-reload' after making changes here.
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/sda1 during installation
UUID=c0a3c695-9fc2-4b3c-898a-a37b0a1c821e /               ext4    errors=remount-ro 0       1
# swap was on /dev/sda5 during installation
UUID=c38d85be-1c7a-427c-8be8-a78483a16bb1 none            swap    sw              0       0
/dev/sr0        /media/cdrom0   udf,iso9660 user,noauto     0       0
UUID=b9ed0b1d-b40f-46a3-95c8-dc84b84418bc /mnt ext4 defaults 0 2
```