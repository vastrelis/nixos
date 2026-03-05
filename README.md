# Install Command

``` shell
sudo nix --experimental-features "nix-command flakes" \
  run github:nix-community/disko/latest -- \
  --mode zap_create_mount \
  --no-root-password \
  --flake "github:vastrelis/nixos#{SYSTEM}"
```
