{
  siteSrc ? builtins.fetchTarball https://github.com/al-ghoul/Nix-Django/archive/main.tar.gz
}:
  let
    pkgs = (import <nixpkgs> { system = builtins.currentSystem or "x86_64-linux"; });
    jobs = with pkgs; {
      django-build = stdenvNoCC.mkDerivation rec {
        name = "Django-build";
        src = siteSrc;

        django = with pkgs.python3Packages; buildPythonPackage rec {
          pname = "Django";
          version = "5.0";
          src = fetchPypi {
            inherit pname version;
            sha256 = "sha256-fSnhTfvBnLapWkvWae294R9dTGpx/apCwtQLaEboB/c=";
          };
          doCheck = false;
        };

        asgiref = with pkgs.python3Packages; buildPythonPackage rec {
          pname = "asgiref";
          version = "3.7.2";
          src = fetchPypi {
            inherit pname version;
            sha256 = "sha256-ngzjqpOoGbpbRRICFrI4eM9uhSXrOEhlNFK0GSuSr+0=";
          };
          doCheck = false;
        };

        sqlparse = with pkgs.python3Packages; buildPythonPackage rec {
          pname = "sqlparse";
          version = "0.4.4";
          format = "wheel";
          src = fetchPypi {
            inherit pname version format;
            dist = "py3";
            python = "py3";
            sha256 = "5430a4fe2ac7d0f93e66f1efc6e1338a41884b7ddf2a350cedd20ccc4d9d28f3";
          };
          doCheck = false;
        };

        buildInputs = [
          python3
          django
          asgiref
          sqlparse
        ];

        buildPhase = ''
          runHook preBuild
          python manage.py test tests
          runHook postBuild
        '';

        installPhase = ''
          runHook preInstall
          mkdir -p $out
          mv {.,}* $out
          runHook postInstall
        '';
        
        doDist = false;
        doCheck = false;
      };
    };
  in
    jobs

