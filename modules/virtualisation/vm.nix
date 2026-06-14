{
  pkgs,
  lib,
  config,
  ...
}: {
  options.modules.virtualisation.vm.enable = lib.mkEnableOption "Enables virtual machines";

  config = lib.mkIf config.modules.virtualisation.vm.enable {
    users.users.hollowillow.extraGroups = ["libvirtd"];

    environment.systemPackages = with pkgs; [
      dnsmasq
      #   virt-manager
      #   virt-viewer
      #   spice
      #   spice-gtk
      #   spice-protocol
      #   win-virtio
      #   win-spice
    ];
    networking.firewall.trustedInterfaces = ["virbr0"];
    programs.virt-manager.enable = true;

    virtualisation = {
      libvirtd = {
        enable = true;
        # qemu = {
        #   swtpm.enable = true;
        #   ovmf.enable = true;
        #   ovmf.packages = [pkgs.OVMFFull.fd];
        # };
      };
      # spiceUSBRedirection.enable = true;
    };
    # services.spice-vdagentd.enable = true;
  };
}
