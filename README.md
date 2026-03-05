# Install Ccommand
'''
sudo nix --experimental-features "nix-command flakes" \
  run github:nix-community/disko/latest -- \
  --mode zap_create_mount \
  --flake "github:vastrelis/nixos#{SYSTEM}"
'''
