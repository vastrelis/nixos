# Install Command
``` shell
sudo nix --experimental-features "nix-command flakes" \
  run github:nix-community/disko/latest -- \
  --mode zap_create_mount \
  --no-root-password \
  --flake "github:vastrelis/nixos#{SYSTEM}"
```
``` shell
nixos-generate-config --no-filesystems --root /mnt
```
``` shell
git clone https://github.com/vastrelis/nixos
```
``` shell
nix flake update --extra-experimental-features nix-command --extra-experimental-features flakes
```
``` shell
sudo nixos-install --flake .#vstr-desktop-0 --no-root-password
```
