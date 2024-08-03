{ lib }:

modulePath: staticArgs:

# check the implementation of `importApply` in flake-parts and nixpkgs #230588 for details
let
  inherit (lib) attrNames intersectLists isFunction length setDefaultModuleLocation;

  f = import modulePath;

  # names of arguments passed to `importApplyWithArgs`
  staticArgNames = attrNames staticArgs;

  # names of arguments used in the importing module
  # the module might not use arguments from `importApplyWithArgs`
  # the module is
  # 1. either a set or a function that returns a set
  # 2. if `importApplyWithArgs` is used, the module will either be a function that returns a set
  #   or a function of a function that returns a set
  #   and one or more names of the first attrset styled argument will match one of the names in `staticArg`
  moduleArgNames = if isFunction f then attrNames (__functionArgs f) else [ ];

  argUsed = length (intersectLists staticArgNames moduleArgNames) > 0;
in
setDefaultModuleLocation modulePath (
  if argUsed
  then
    f staticArgs
  else
    f
)
