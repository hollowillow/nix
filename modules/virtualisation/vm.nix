{
  pkgs,
  lib,
  config,
  ...
}: {
  options.modules.virtualisation.vm.enable = lib.mkEnableOption "Enables virtual machines";

  config = lib.mkIf config.modules.virtualisation.vm.enable {
    programs.dconf.enable = true;

    # Add user to libvirtd group
    users.users.hollowillow.extraGroups = ["libvirtd"];

    # Install necessary packages
    environment.systemPackages = with pkgs; [
      virt-manager
      virt-viewer
      spice
      spice-gtk
      spice-protocol
      virtio-win
      win-spice
    ];

    # Manage the virtualisation services
    virtualisation = {
      libvirtd = {
        enable = true;
        qemu = {
          swtpm.enable = true;
        };
      };
      spiceUSBRedirection.enable = true;
    };
    services.spice-vdagentd.enable = true;

    networking.firewall.trustedInterfaces = ["virbr0"];
    programs.virt-manager.enable = true;
  };
}
