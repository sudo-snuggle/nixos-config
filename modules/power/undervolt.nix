{ pkgs, ... }:

{
  services.undervolt = {
    enable = true;
    
    # Offsets are in mV. 
    coreOffset = -90;
    gpuOffset = -40;
    uncoreOffset = -90;
    analogioOffset = 0;

    # Optional: Set a temperature target 
    # temp = -5;  #looks like it MSR doesnt let 
  };

  # Ensure the package is available for manual checking
  environment.systemPackages = [ pkgs.undervolt ];
}