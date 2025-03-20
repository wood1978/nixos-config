{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    plank
  ];
}
