# Home manager Without Installing {#home-manager-without-installing}

2020-06-27

[home-manager](https://github.com/rycee/home-manager) is a great way
to manage your user environment in a declarative reproducible
way. Let's go the extra mile and reproducibly deploy our home
configuration. In this post, I'll show you how to reproducibly deploy
a home-manger configuration without installing home manager.

Here's how you do it: make a `shell.nix` file:

```nix
with import <nixpkgs> {};

stdenv.mkDerivation rec {
  name = "nixops-shell";

  buildInputs = [
    nixops
  ];

  revision = "06c576b0525da85f2de86b3c13bb796d6a0c20f6"; # 18.03 on 2018-04-23

  shellHook = ''
    export NIX_PATH="nixpkgs=https://github.com/NixOs/nixpkgs-channels/archive/${revision}.tar.gz:."
    export NIXOPS_STATE="./state.nixops"

    function our_create () {
      if [ `nixops list | grep -c $1` -eq 0 ]
      then
       (set -x; nixops create --deployment $1 "&lt;$1.nix&gt;")
      fi
    }

    our_create host1 # change this
    our_create host2 # change this
  '';

}
```

This nix expression for `nix-shell` installs nixops, pins
the version of nixpkgs used by nixops and creates two deployments:
"host1", and "host2". It expects that the `host1.nix` and
`host2.nix` deployment configuration files already exist.

If the `our_create` function checks if the deployments
exist in the state file, and adds them. If you want to add a new
deployment, you add another `our_create` line in the
shell.nix `shellHook`, exit the nix shell, and restart
it.

The shell.nix file should be commited to version control, and the
`state.nixops` file should be added to the version
control ignore file (for example, `.gitignore`).

There's one more thing you need to do to make this work. By default,
nixops stores an SSH key in the state file for logging in as
root. We need to add either a shared SSH key, or an SSH key for each
collaborator that gives them root access in each host deployment
configuration:

```nix
{
  host1 =
  { config, pkgs, ... }:
  {
    deployment.targetHost = "1.2.3.4";
    users.users.root.openssh.authorizedKeys.keyFiles = [ ./collaborator1.pub ./collaborator2.pub ];
  };
}
```

After the initial configuration, this will allow any of the
collaborators to use nixops commands to manage the machine using
their ssh key instead of the one provided in the state file.

With this configuration, we do not rely on any of the information
stored in the state file for basic deployment of nixos
configurations to nixos machines.
