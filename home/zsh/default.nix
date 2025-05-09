{
	programs.zsh = {
		enable = true;
		autosuggestion.enable = true;
		enableCompletion = true;
		
		syntaxHighlighting = {
			enable = true;
			highlighters = [
				"main"
				"brackets"
				"pattern"
				"line"
			];
		};
		shellAliases = {
			ll = "ls -l";
			rebuild = "sudo nixos-rebuild switch --flake /etc/nixos#yazid";
			yazid = "pfetch";
			pohon = "tree";
			# nixrbt = "sudo nixos-rebuild test --flake ~/nix#dosed";
			# nixrbb = "sudo nixos-rebuild boot --flake ~/nix#dosed";
			# nixconf = "cd ~/nix/nixos && nvim configuration.nix";
			# homeconf = "cd ~/nix/home && nvim default.nix";
			# crun = "g++ main.cpp -o main && ./main";
			# gaa = "git add --all";
		};

		    initExtra = ''
      			eval "$(starship init zsh)"
			eval "$(direnv hook zsh)"
    		    '';
		#oh-my-zsh = {
		#	enable = true;
		#	theme = "af-magic";
		#	plugins = ["git" "sudo" "kubectl" "aliases" "alias-finder" "fzf" "github" "golang" "httpie" "kitty" "man" "tmux" "vi-mode"];
		#};

	};
}
