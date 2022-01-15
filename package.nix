{
, stdenv
, lib
, fetchurl
, fetchFromGitHub
,
}:

stdenv.mkDerivation {
    pname = "mogrias-dotfiles";
    version = "0.0.1";

    src = "./";

    nativeBuildInputs = [

    ];

    meta = with lib; {
        description = "Mogrias dotfiles";
        longdescription = ''
          A collection of various user configurtion for programs such as vim, tmux and bash.
        '';
        homepage = https://github.com/mogria/dotfiles;
        # license = licenses.;
        maintainers = maintainers.mogria;
        platforms = with platforms; [ unix linux openbsd gnu ];
    };

}
