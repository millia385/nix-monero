{config, pkgs, ...}: {
  services.monero.enable = true;

  services.monero.extraConfig = ''
    enforce-dns-checkpointing=1
    enable-dns-blocklist=1
    out-peers=32
    in-peers=64
  '';
}