{ pkgs, ... }:

{
  fileSystems."/mnt/ssd" = {
    device = "/dev/disk/by-uuid/6b9143e8-66c2-404a-9699-ce4025ee0704";
    fsType = "btrfs";
    options = [
      "defaults"
      "compress=zstd"
      "nofail"
    ];
  };

  fileSystems."/mnt/reinas" = {
    device = "//192.168.1.209/Media";
    fsType = "cifs";
    options = [
      "credentials=/etc/samba/credentials"
      "uid=1000"
      "gid=100"
      "iocharset=utf8"
      "nofail"
      "x-systemd.automount"
    ];
  };

  environment.systemPackages = with pkgs; [ cifs-utils ];
}
