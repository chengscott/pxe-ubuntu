# pxe-bionic

## Run

1. Prepare necessary files
2. Run DHCP server
3. Run TFTP server

```shell
$ docker run --name tftp-server --rm -p 69:69/udp -v pxe:/var/tftpboot chengscott/tftp-server
```

## Ubuntu Bionic PXE

- Directory structure

```
pxe
├── grub
│   └── grub.cfg
├── grubnetx64.efi.signed
├── initrd.gz
├── linux
└── my_ubuntu.seed
```

1. Download `grubnetx64.efi.signed`, `initrd.gz`, `linux`

```bash
export DIST=bionic
export MIRROR=http://ubuntu.cs.nctu.edu.tw/ubuntu/dists/${DIST}-updates/main
wget $MIRROR/uefi/grub2-amd64/current/grubnetx64.efi.signed
wget $MIRROR/installer-amd64/current/images/hwe-netboot/ubuntu-installer/amd64/{linux,initrd.gz}
```

2. Prepare `grub.cfg`

> Due to netboot, `netcfg/` must be set outside of preseed.

3. Prepare preseed (`my_ubuntu.cfg`)

> one can generate password conform to [crypt (3)](https://man7.org/linux/man-pages/man3/crypt.3.html) format.
> `openssl passwd -6 -salt some_random_salt`
