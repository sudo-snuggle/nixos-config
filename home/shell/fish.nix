 { config, pkgs, inputs, ... }:

 {

 programs.fish = {
    enable = true;
    shellAliases = {
      # Updated path to your new home folder!
      editconfig = "codium /home/yasiru/home_manager";
      check = "sudo nixos-rebuild dry-activate";
      clean = "sudo nix-collect-garbage -d";
      update = "sudo nixos-rebuild switch";
      ff = "fastfetch";
      cat = "bat";
      ls = "eza --icons";
    };

    shellInit = ''
      set -g fish_greeting ""
      if command -q zoxide
        zoxide init fish | source
      end

      function fish_prompt
          set -l last_status $status
          set -l pink (set_color ff79c6)
          set -l soft_pink (set_color ffc0cb)
          set -l purple (set_color bd93f9)
          set -l cyan (set_color 8be9fd)
          set -l white (set_color ffffff)
          set -l normal (set_color normal)

          set -l greetings "nya~" "paws" "soft" ":3" "mrrp" "meow" "owo"
          set -l random_greet (random choice $greetings)

          echo -n $pink"┌───〈 🎀 "$purple(whoami)$pink" 〉"
          echo -n "───『 "$white"he/him"$pink" 』"
          echo " "$pink"──〈 "$soft_pink$random_greet$pink" 〉"
          echo -n $pink"├─🐾 "$cyan(prompt_pwd)

          if functions -q __fish_git_prompt
              set -l git_info (__fish_git_prompt "  %s")
              if test -n "$git_info"
                  echo -n $white" ── "$purple$git_info
              end
          end
          echo ""

          if test $last_status -eq 0
              echo -n $pink"└─🌈 "$soft_pink"❯"$pink"❯"$white"❯ "$normal
          else
              echo -n $pink"└─"$white"💔"$pink"❯"$white"❯ "$normal
          end
      end

      function fish_right_prompt
          set_color ff79c6
          echo -n ">////<"
          set_color normal
      end
    '';
  };

}
