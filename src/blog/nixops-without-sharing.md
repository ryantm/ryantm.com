# nixops without sharing {#nixops-without-sharing}
%p

  The default setup for nixops seems to be tuned for a setup involving
  many machines where the a state file is necessary to properly manage
  the machines. Unfortunately, the state file makes it hard to
  collaborate because every nixops command modifies the state
  file.

%p
  Suggested fixes include commiting the state file to git and
  using a shared machine. The former fix breaks if collaborators each
  run nixops commands in parallel, because they will have a merge
  conflict on the state file. And the latter approach is tricky,
  because two people really shouldn't be editing the same repository
  at the same time.

%p

  Another option, the one that I use, is to configure nixops so the
  state file is not necessary. Each collaborator will have their own
  state file, but that's okay, because you won't use it for anything
  critical. I expect that this will break some features of nixops, but
  I haven't run into an issue for my use case of a few machines each
  with their own deployments, I haven't needed anything aside from
  <code>nixops deploy</code>, which works.

%p

  Note, this will only work if all the machines were provisioned
  outside of NixOps and therefore do not rely on hosting APIs (like
  EC2) to manage the machine lifecycle.

%p
  Here's how you do it: make a <code>shell.nix</code> file:

%pre.language-nix
  %code.html.language-nix
    :preserve
      with import &lt;nixpkgs&gt; {};

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

%p

  This nix expression for <code>nix-shell</code> installs nixops, pins
  the version of nixpkgs used by nixops and creates two deployments:
  "host1", and "host2". It expects that the <code>host1.nix</code> and
  <code>host2.nix</code> deployment configuration files already exist.

%p

  If the <code>our_create</code> function checks if the deployments
  exist in the state file, and adds them. If you want to add a new
  deployment, you add another <code>our_create</code> line in the
  shell.nix <code>shellHook</code>, exit the nix shell, and restart
  it.

%p

  The shell.nix file should be commited to version control, and the
  <code>state.nixops</code> file should be added to the version
  control ignore file (for example, <code>.gitignore</code>).

%p

  There's one more thing you need to do to make this work. By default,
  nixops stores an SSH key in the state file for logging in as
  root. We need to add either a shared SSH key, or an SSH key for each
  collaborator that gives them root access in each host deployment
  configuration:

%pre.language-nix
  %code.html.language-nix
    :preserve
      {
        host1 =
        { config, pkgs, ... }:
        {
          deployment.targetHost = "1.2.3.4";
          users.users.root.openssh.authorizedKeys.keyFiles = [ ./collaborator1.pub ./collaborator2.pub ];
        };
      }

%p

  After the initial configuration, this will allow any of the
  collaborators to use nixops commands to manage the machine using
  their ssh key instead of the one provided in the state file.

%p

  With this configuration, we do not rely on any of the information
  stored in the state file for basic deployment of nixos
  configurations to nixos machines.
