packer { 
  required_plugins {
    parallels = {
      version = ">= 1.0.1"
      source = "github.com/hashicorp/parallels"
    }
  }
}

source "parallels-iso" "basic-example" {
  guest_os_type = "ubuntu"
  // iso_url = "http://releases.ubuntu.com/12.04/ubuntu-18.04.2-server-arm64.iso"
  iso_url = "https://cdimage.ubuntu.com/ubuntu-server/daily-live/current/kinetic-live-server-arm64.iso"
  iso_checksum = "a19d956e993a16fc6496c371e36dcc0eb85d2bdf6a8e86028b92ce62e9f585cd"

  ssh_username = "ubuntu"
  ssh_password = "ubuntu"
  ssh_timeout = "30m"

  boot_wait = "5s"

  parallels_tools_flavor = "lin"
  shutdown_command = "echo 'packer' | sudo -S shutdown -P now"
boot_command = [
// "<esc><esc><enter><wait>",
//   "/install/vmlinuz noapic ",
//   "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg ",
//   "debian-installer=en_US auto locale=en_US kbd-chooser/method=us ",
//   "hostname={{ .Name }} ",
//   "fb=false debconf/frontend=noninteractive ",
//   "keyboard-configuration/modelcode=SKIP keyboard-configuration/layout=USA ",
//   "keyboard-configuration/variant=USA console-setup/ask_detect=false ",
//   "initrd=/install/initrd.gz -- <enter>;"
//  "<enter><enter><f6><esc><wait> ",
//         "autoinstall ds=nocloud-net;seedfrom=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
//         "<enter><wait>",
        "<tab><tab><tab><tab><tab><c><wait><bs><bs>",
      "linux /casper/vmlinuz --- autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
      "<enter><wait>",
// "initrd /casper/initrd<enter><wait>",
// "boot<enter>"
//  "<enter><enter><f6><esc><wait> ",
//         "autoinstall ds=nocloud-net;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/",
//         "<enter>"
]

// boot_command = [
// "<esc><wait>",
// "<esc><wait>",
// "<esc><wait>",
// "/install/vmlinuz<wait>",
// " auto<wait>",
// " console-setup/ask_detect=false<wait>",
// " console-setup/layoutcode=us<wait>",
// " console-setup/modelcode=pc105<wait>",
// " debconf/frontend=noninteractive<wait>",
// " debian-installer=en_US<wait>",
// " fb=false<wait>",
// " initrd=/install/initrd.gz<wait>",
// " kbd-chooser/method=us<wait>",
// " keyboard-configuration/layout=USA<wait>",
// " keyboard-configuration/variant=USA<wait>",
// " locale=en_US<wait>",
// " netcfg/get_domain=vm<wait>",
// " netcfg/get_hostname=vagrant<wait>",
// " grub-installer/bootdev=/dev/sda<wait>",
// " noapic<wait>",
// " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ubuntu1804-preseed.cfg<wait>",
// " -- <wait>",
// "<enter><wait>"
// ]
}

build {
  sources = ["sources.parallels-iso.basic-example"]
}
