$env.config.show_banner = false
$env.config.buffer_editor = "hx"
$env.EDITOR = "hx"
$env.SUDO_EDITOR = "hx"
$env.VISUAL = "hx"
$env.path ++= ["~/.local/bin", "~/.cargo/bin"]

# hook to get direnv to work with nushell
$env.config = {
  hooks: {
    env_change: {
      PWD: [{ ||
        if (which direnv | is-empty) {
          return
        }

        direnv export json | from json | default {} | load-env
        if 'ENV_CONVERSIONS' in $env and 'PATH' in $env.ENV_CONVERSIONS {
          $env.PATH = do $env.ENV_CONVERSIONS.PATH.from_string $env.PATH
        }
      }]
    }
  }
}

alias lg = lazygit
alias gu = gitui
alias c = cargo
alias v = nvim
alias switch = sudo darwin-rebuild switch --flake ~/.config/nix

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
source ~/.zoxide.nu
