للعربية إضغط علي الرابط التالي: [التوثيق](docs/ar/)

# Intro

This is a NixOS [hydra](https://nixos.wiki/wiki/Hydra) [Django](https://www.djangoproject.com/) build example.

# Adding this project (or a fork) to hydra

To add this project or even a fork of it to your local hydra's instance, follow these steps:

## Installation

1. Visit your dashboard usually @ http://localhost:3000/
2. Click on Admin -> Create project (Assuming you created your admin account & already logged in, if not follow their [installation and setup](https://github.com/NixOS/hydra?tab=readme-ov-file#installation-and-setup) docs)

## Adding a project

<details>
<summary>Add project steps</summary>
   
1. Identifier: Nix-Django (or anything you'd like but it has to be unique among your other projects)
2. Display name: Nix-Django
3. Desciption: 	A Django hydra example.
4. Homepage (This one could be docs page or project's github url): https://github.com/Al-Ghoul/Nix-Django
5. Create project (ignore everything else, declative spec/input are meant to provide all the info in a JSON format, declaratively (I'll refer to that later))

</details>

## Adding jobset(s)

<details>
<summary>Add initial job</summary>

1. After creating your project, go to hydra's index page, you'll find your project listed there click on the identifier.
2. Click on actions -> Create jobset.
3. Identifier: Nix-Django-Build (Keeping State: Enabled, Visible: Ticked).
4. Type: Legacy (I'll provide a flake example later).
5. Description: Nix-Hello's build jobset.
6. Nix expression: release.nix **in** siteSrc.
7. Check interval: 60 (seconds).
8. Scheduling shares: 1.

</details>

<details>
<summary>Add dependencies inputs</summary>
Skip everything and scroll down to inputs section:

1. Click on Add a new input:

-   Input name: siteSrc (This input's name gets passed to [release.nix](https://github.com/Al-Ghoul/Nix-Django/blob/main/release.nix#L2))
-   Type: Git checkout
-   Value: "https://github.com/Al-Ghoul/Nix-Django main" (with no quotes) <br>
    or provide your projects url, wondering why the extra 'main'?, well by default hydra tries to fetch from master branch, so you can override it like that

2. Add a second input(You'll need another input for nixpkgs):

-   Input name: nixpkgs
-   Type: Git checkout
-   Value: "https://github.com/nixos/nixpkgs nixos-23.11" (with no quotes) <br>
    again 'nixos-23.11' overrides or 'specifies' the branch

</details>

# References

[NixOS Hydra's Manual](https://hydra.nixos.org/build/196107287/download/1/hydra/introduction.html) <br>
[NixOS Hydra's Official Repo](https://github.com/NixOS/hydra) <br>
[NixOS Hydra's Wiki](https://nixos.wiki/wiki/Hydra)
