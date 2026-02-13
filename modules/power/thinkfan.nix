{ config, pkgs, ... }:

{
boot.kernelParams = [ "thinkpad_acpi.fan_control=1" ];
boot.extraModprobeConfig = ''
  options thinkpad_acpi fan_control=1
'';

  services.thinkfan = {
    enable = true;
    levels = [
      [0  0 45]   # Fan OFF until 45°C
      [1 42 55] 
      [3 50 65]  
      [5 60 75]  
      ["level full-speed" 75 32767] 
    ];
    
  sensors = [
      {
        type = "hwmon";
        # Path for ThinkPad specific thermal sensors
        query = "/sys/class/hwmon/hwmon2/temp1_input";
      }
      {
        type = "hwmon";
        # Path for CPU Core sensors
        query = "/sys/class/hwmon/hwmon7/temp1_input";
      }
    ];

      fans = [
      {
        type = "tpacpi";
        query = "/proc/acpi/ibm/fan";
      }
      ];

  };
}