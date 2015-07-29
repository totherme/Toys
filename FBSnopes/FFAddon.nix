{ self, fetchurl, fetchgit ? null, lib }:

{
  by-spec."adm-zip"."~0.4.x" =
    self.by-version."adm-zip"."0.4.7";
  by-version."adm-zip"."0.4.7" = self.buildNodePackage {
    name = "adm-zip-0.4.7";
    version = "0.4.7";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/adm-zip/-/adm-zip-0.4.7.tgz";
      name = "adm-zip-0.4.7.tgz";
      sha1 = "8606c2cbf1c426ce8c8ec00174447fd49b6eafc1";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."any-promise"."~0.1.0" =
    self.by-version."any-promise"."0.1.0";
  by-version."any-promise"."0.1.0" = self.buildNodePackage {
    name = "any-promise-0.1.0";
    version = "0.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/any-promise/-/any-promise-0.1.0.tgz";
      name = "any-promise-0.1.0.tgz";
      sha1 = "830b680aa7e56f33451d4b049f3bd8044498ee27";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."archiver"."~0.14.3" =
    self.by-version."archiver"."0.14.4";
  by-version."archiver"."0.14.4" = self.buildNodePackage {
    name = "archiver-0.14.4";
    version = "0.14.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/archiver/-/archiver-0.14.4.tgz";
      name = "archiver-0.14.4.tgz";
      sha1 = "5b9ddb9f5ee1ceef21cb8f3b020e6240ecb4315c";
    };
    deps = {
      "async-0.9.2" = self.by-version."async"."0.9.2";
      "buffer-crc32-0.2.5" = self.by-version."buffer-crc32"."0.2.5";
      "glob-4.3.5" = self.by-version."glob"."4.3.5";
      "lazystream-0.1.0" = self.by-version."lazystream"."0.1.0";
      "lodash-3.2.0" = self.by-version."lodash"."3.2.0";
      "readable-stream-1.0.33" = self.by-version."readable-stream"."1.0.33";
      "tar-stream-1.1.5" = self.by-version."tar-stream"."1.1.5";
      "zip-stream-0.5.2" = self.by-version."zip-stream"."0.5.2";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."async"."~0.9.0" =
    self.by-version."async"."0.9.2";
  by-version."async"."0.9.2" = self.buildNodePackage {
    name = "async-0.9.2";
    version = "0.9.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/async/-/async-0.9.2.tgz";
      name = "async-0.9.2.tgz";
      sha1 = "aea74d5e61c1f899613bf64bda66d4c78f2fd17d";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."balanced-match"."^0.2.0" =
    self.by-version."balanced-match"."0.2.0";
  by-version."balanced-match"."0.2.0" = self.buildNodePackage {
    name = "balanced-match-0.2.0";
    version = "0.2.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/balanced-match/-/balanced-match-0.2.0.tgz";
      name = "balanced-match-0.2.0.tgz";
      sha1 = "38f6730c03aab6d5edbb52bd934885e756d71674";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."bl"."^0.9.0" =
    self.by-version."bl"."0.9.4";
  by-version."bl"."0.9.4" = self.buildNodePackage {
    name = "bl-0.9.4";
    version = "0.9.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/bl/-/bl-0.9.4.tgz";
      name = "bl-0.9.4.tgz";
      sha1 = "4702ddf72fbe0ecd82787c00c113aea1935ad0e7";
    };
    deps = {
      "readable-stream-1.0.33" = self.by-version."readable-stream"."1.0.33";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."brace-expansion"."^1.0.0" =
    self.by-version."brace-expansion"."1.1.0";
  by-version."brace-expansion"."1.1.0" = self.buildNodePackage {
    name = "brace-expansion-1.1.0";
    version = "1.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/brace-expansion/-/brace-expansion-1.1.0.tgz";
      name = "brace-expansion-1.1.0.tgz";
      sha1 = "c9b7d03c03f37bc704be100e522b40db8f6cfcd9";
    };
    deps = {
      "balanced-match-0.2.0" = self.by-version."balanced-match"."0.2.0";
      "concat-map-0.0.1" = self.by-version."concat-map"."0.0.1";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."buffer-crc32"."~0.2.1" =
    self.by-version."buffer-crc32"."0.2.5";
  by-version."buffer-crc32"."0.2.5" = self.buildNodePackage {
    name = "buffer-crc32-0.2.5";
    version = "0.2.5";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/buffer-crc32/-/buffer-crc32-0.2.5.tgz";
      name = "buffer-crc32-0.2.5.tgz";
      sha1 = "db003ac2671e62ebd6ece78ea2c2e1b405736e91";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."commander"."2.6.0" =
    self.by-version."commander"."2.6.0";
  by-version."commander"."2.6.0" = self.buildNodePackage {
    name = "commander-2.6.0";
    version = "2.6.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/commander/-/commander-2.6.0.tgz";
      name = "commander-2.6.0.tgz";
      sha1 = "9df7e52fb2a0cb0fb89058ee80c3104225f37e1d";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."compress-commons"."~0.2.0" =
    self.by-version."compress-commons"."0.2.9";
  by-version."compress-commons"."0.2.9" = self.buildNodePackage {
    name = "compress-commons-0.2.9";
    version = "0.2.9";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/compress-commons/-/compress-commons-0.2.9.tgz";
      name = "compress-commons-0.2.9.tgz";
      sha1 = "422d927430c01abd06cd455b6dfc04cb4cf8003c";
    };
    deps = {
      "buffer-crc32-0.2.5" = self.by-version."buffer-crc32"."0.2.5";
      "crc32-stream-0.3.4" = self.by-version."crc32-stream"."0.3.4";
      "node-int64-0.3.3" = self.by-version."node-int64"."0.3.3";
      "readable-stream-1.0.33" = self.by-version."readable-stream"."1.0.33";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."concat-map"."0.0.1" =
    self.by-version."concat-map"."0.0.1";
  by-version."concat-map"."0.0.1" = self.buildNodePackage {
    name = "concat-map-0.0.1";
    version = "0.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/concat-map/-/concat-map-0.0.1.tgz";
      name = "concat-map-0.0.1.tgz";
      sha1 = "d8a96bd77fd68df7793a73036a3ba0d5405d477b";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."core-util-is"."~1.0.0" =
    self.by-version."core-util-is"."1.0.1";
  by-version."core-util-is"."1.0.1" = self.buildNodePackage {
    name = "core-util-is-1.0.1";
    version = "1.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/core-util-is/-/core-util-is-1.0.1.tgz";
      name = "core-util-is-1.0.1.tgz";
      sha1 = "6b07085aef9a3ccac6ee53bf9d3df0c1521a5538";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."crc32-stream"."~0.3.1" =
    self.by-version."crc32-stream"."0.3.4";
  by-version."crc32-stream"."0.3.4" = self.buildNodePackage {
    name = "crc32-stream-0.3.4";
    version = "0.3.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/crc32-stream/-/crc32-stream-0.3.4.tgz";
      name = "crc32-stream-0.3.4.tgz";
      sha1 = "73bc25b45fac1db6632231a7bfce8927e9f06552";
    };
    deps = {
      "readable-stream-1.0.33" = self.by-version."readable-stream"."1.0.33";
      "buffer-crc32-0.2.5" = self.by-version."buffer-crc32"."0.2.5";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."end-of-stream"."^1.0.0" =
    self.by-version."end-of-stream"."1.1.0";
  by-version."end-of-stream"."1.1.0" = self.buildNodePackage {
    name = "end-of-stream-1.1.0";
    version = "1.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/end-of-stream/-/end-of-stream-1.1.0.tgz";
      name = "end-of-stream-1.1.0.tgz";
      sha1 = "e9353258baa9108965efc41cb0ef8ade2f3cfb07";
    };
    deps = {
      "once-1.3.2" = self.by-version."once"."1.3.2";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."firefox-profile"."0.3.9" =
    self.by-version."firefox-profile"."0.3.9";
  by-version."firefox-profile"."0.3.9" = self.buildNodePackage {
    name = "firefox-profile-0.3.9";
    version = "0.3.9";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/firefox-profile/-/firefox-profile-0.3.9.tgz";
      name = "firefox-profile-0.3.9.tgz";
      sha1 = "fece85e6c1b81753a3493d7c334775b4c2c16d04";
    };
    deps = {
      "jetpack-id-0.0.4" = self.by-version."jetpack-id"."0.0.4";
      "adm-zip-0.4.7" = self.by-version."adm-zip"."0.4.7";
      "archiver-0.14.4" = self.by-version."archiver"."0.14.4";
      "async-0.9.2" = self.by-version."async"."0.9.2";
      "fs-extra-0.16.5" = self.by-version."fs-extra"."0.16.5";
      "lazystream-0.1.0" = self.by-version."lazystream"."0.1.0";
      "lodash-3.5.0" = self.by-version."lodash"."3.5.0";
      "node-uuid-1.4.3" = self.by-version."node-uuid"."1.4.3";
      "wrench-1.5.8" = self.by-version."wrench"."1.5.8";
      "xml2js-0.4.9" = self.by-version."xml2js"."0.4.9";
      "ini-1.3.3" = self.by-version."ini"."1.3.3";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."fs-extra"."0.16.4" =
    self.by-version."fs-extra"."0.16.4";
  by-version."fs-extra"."0.16.4" = self.buildNodePackage {
    name = "fs-extra-0.16.4";
    version = "0.16.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/fs-extra/-/fs-extra-0.16.4.tgz";
      name = "fs-extra-0.16.4.tgz";
      sha1 = "3e3d3cd6f388e2acbc0fc2e0202f0533ec0507b1";
    };
    deps = {
      "graceful-fs-3.0.8" = self.by-version."graceful-fs"."3.0.8";
      "jsonfile-2.0.1" = self.by-version."jsonfile"."2.0.1";
      "rimraf-2.3.4" = self.by-version."rimraf"."2.3.4";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."fs-extra"."~0.16.x" =
    self.by-version."fs-extra"."0.16.5";
  by-version."fs-extra"."0.16.5" = self.buildNodePackage {
    name = "fs-extra-0.16.5";
    version = "0.16.5";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/fs-extra/-/fs-extra-0.16.5.tgz";
      name = "fs-extra-0.16.5.tgz";
      sha1 = "1ad661fa6c86c9608cd1b49efc6fce834939a750";
    };
    deps = {
      "graceful-fs-3.0.8" = self.by-version."graceful-fs"."3.0.8";
      "jsonfile-2.0.1" = self.by-version."jsonfile"."2.0.1";
      "rimraf-2.3.4" = self.by-version."rimraf"."2.3.4";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."fs-promise"."0.3.1" =
    self.by-version."fs-promise"."0.3.1";
  by-version."fs-promise"."0.3.1" = self.buildNodePackage {
    name = "fs-promise-0.3.1";
    version = "0.3.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/fs-promise/-/fs-promise-0.3.1.tgz";
      name = "fs-promise-0.3.1.tgz";
      sha1 = "bf34050368f24d6dc9dfc6688ab5cead8f86842a";
    };
    deps = {
      "any-promise-0.1.0" = self.by-version."any-promise"."0.1.0";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."fx-runner"."0.0.7" =
    self.by-version."fx-runner"."0.0.7";
  by-version."fx-runner"."0.0.7" = self.buildNodePackage {
    name = "fx-runner-0.0.7";
    version = "0.0.7";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/fx-runner/-/fx-runner-0.0.7.tgz";
      name = "fx-runner-0.0.7.tgz";
      sha1 = "e287179191c00d414c48f73f56a0192e25a4fe43";
    };
    deps = {
      "commander-2.6.0" = self.by-version."commander"."2.6.0";
      "fs-promise-0.3.1" = self.by-version."fs-promise"."0.3.1";
      "lodash-2.4.1" = self.by-version."lodash"."2.4.1";
      "when-3.6.4" = self.by-version."when"."3.6.4";
      "winreg-0.0.12" = self.by-version."winreg"."0.0.12";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."glob"."^4.4.2" =
    self.by-version."glob"."4.5.3";
  by-version."glob"."4.5.3" = self.buildNodePackage {
    name = "glob-4.5.3";
    version = "4.5.3";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/glob/-/glob-4.5.3.tgz";
      name = "glob-4.5.3.tgz";
      sha1 = "c6cb73d3226c1efef04de3c56d012f03377ee15f";
    };
    deps = {
      "inflight-1.0.4" = self.by-version."inflight"."1.0.4";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
      "minimatch-2.0.8" = self.by-version."minimatch"."2.0.8";
      "once-1.3.2" = self.by-version."once"."1.3.2";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."glob"."~4.3.0" =
    self.by-version."glob"."4.3.5";
  by-version."glob"."4.3.5" = self.buildNodePackage {
    name = "glob-4.3.5";
    version = "4.3.5";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/glob/-/glob-4.3.5.tgz";
      name = "glob-4.3.5.tgz";
      sha1 = "80fbb08ca540f238acce5d11d1e9bc41e75173d3";
    };
    deps = {
      "inflight-1.0.4" = self.by-version."inflight"."1.0.4";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
      "minimatch-2.0.8" = self.by-version."minimatch"."2.0.8";
      "once-1.3.2" = self.by-version."once"."1.3.2";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."graceful-fs"."^3.0.5" =
    self.by-version."graceful-fs"."3.0.8";
  by-version."graceful-fs"."3.0.8" = self.buildNodePackage {
    name = "graceful-fs-3.0.8";
    version = "3.0.8";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/graceful-fs/-/graceful-fs-3.0.8.tgz";
      name = "graceful-fs-3.0.8.tgz";
      sha1 = "ce813e725fa82f7e6147d51c9a5ca68270551c22";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."inflight"."^1.0.4" =
    self.by-version."inflight"."1.0.4";
  by-version."inflight"."1.0.4" = self.buildNodePackage {
    name = "inflight-1.0.4";
    version = "1.0.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/inflight/-/inflight-1.0.4.tgz";
      name = "inflight-1.0.4.tgz";
      sha1 = "6cbb4521ebd51ce0ec0a936bfd7657ef7e9b172a";
    };
    deps = {
      "once-1.3.2" = self.by-version."once"."1.3.2";
      "wrappy-1.0.1" = self.by-version."wrappy"."1.0.1";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."inherits"."2" =
    self.by-version."inherits"."2.0.1";
  by-version."inherits"."2.0.1" = self.buildNodePackage {
    name = "inherits-2.0.1";
    version = "2.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/inherits/-/inherits-2.0.1.tgz";
      name = "inherits-2.0.1.tgz";
      sha1 = "b17d08d326b4423e568eff719f91b0b1cbdf69f1";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."inherits"."~2.0.1" =
    self.by-version."inherits"."2.0.1";
  by-spec."ini"."~1.3.3" =
    self.by-version."ini"."1.3.3";
  by-version."ini"."1.3.3" = self.buildNodePackage {
    name = "ini-1.3.3";
    version = "1.3.3";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/ini/-/ini-1.3.3.tgz";
      name = "ini-1.3.3.tgz";
      sha1 = "c07e34aef1de06aff21d413b458e52b21533a11e";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."isarray"."0.0.1" =
    self.by-version."isarray"."0.0.1";
  by-version."isarray"."0.0.1" = self.buildNodePackage {
    name = "isarray-0.0.1";
    version = "0.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/isarray/-/isarray-0.0.1.tgz";
      name = "isarray-0.0.1.tgz";
      sha1 = "8a18acfca9a8f4177e09abfc6038939b05d1eedf";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."jetpack-id"."0.0.4" =
    self.by-version."jetpack-id"."0.0.4";
  by-version."jetpack-id"."0.0.4" = self.buildNodePackage {
    name = "jetpack-id-0.0.4";
    version = "0.0.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/jetpack-id/-/jetpack-id-0.0.4.tgz";
      name = "jetpack-id-0.0.4.tgz";
      sha1 = "6fc35a394a4aea190820a2ce7f23d2bb53512a9b";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."jetpack-validation"."0.0.4" =
    self.by-version."jetpack-validation"."0.0.4";
  by-version."jetpack-validation"."0.0.4" = self.buildNodePackage {
    name = "jetpack-validation-0.0.4";
    version = "0.0.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/jetpack-validation/-/jetpack-validation-0.0.4.tgz";
      name = "jetpack-validation-0.0.4.tgz";
      sha1 = "e56f2c6b8f142c8420837755950db8fd86d80b6d";
    };
    deps = {
      "jetpack-id-0.0.4" = self.by-version."jetpack-id"."0.0.4";
      "resolve-0.7.4" = self.by-version."resolve"."0.7.4";
      "semver-2.3.2" = self.by-version."semver"."2.3.2";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."jpm"."*" =
    self.by-version."jpm"."1.0.0";
  by-version."jpm"."1.0.0" = self.buildNodePackage {
    name = "jpm-1.0.0";
    version = "1.0.0";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/jpm/-/jpm-1.0.0.tgz";
      name = "jpm-1.0.0.tgz";
      sha1 = "42c10a9aaabba2b8fc06bfc3c54a8b7bb5eca3f5";
    };
    deps = {
      "commander-2.6.0" = self.by-version."commander"."2.6.0";
      "fs-promise-0.3.1" = self.by-version."fs-promise"."0.3.1";
      "fs-extra-0.16.4" = self.by-version."fs-extra"."0.16.4";
      "fx-runner-0.0.7" = self.by-version."fx-runner"."0.0.7";
      "jpm-core-0.0.9" = self.by-version."jpm-core"."0.0.9";
      "jetpack-id-0.0.4" = self.by-version."jetpack-id"."0.0.4";
      "jetpack-validation-0.0.4" = self.by-version."jetpack-validation"."0.0.4";
      "firefox-profile-0.3.9" = self.by-version."firefox-profile"."0.3.9";
      "jsontoxml-0.0.11" = self.by-version."jsontoxml"."0.0.11";
      "lodash-3.3.1" = self.by-version."lodash"."3.3.1";
      "minimatch-2.0.4" = self.by-version."minimatch"."2.0.4";
      "node-watch-0.3.4" = self.by-version."node-watch"."0.3.4";
      "tmp-0.0.25" = self.by-version."tmp"."0.0.25";
      "open-0.0.5" = self.by-version."open"."0.0.5";
      "promzard-0.3.0" = self.by-version."promzard"."0.3.0";
      "read-1.0.5" = self.by-version."read"."1.0.5";
      "semver-4.3.3" = self.by-version."semver"."4.3.3";
      "mozilla-version-comparator-1.0.2" = self.by-version."mozilla-version-comparator"."1.0.2";
      "mozilla-toolkit-versioning-0.0.2" = self.by-version."mozilla-toolkit-versioning"."0.0.2";
      "when-3.7.2" = self.by-version."when"."3.7.2";
      "zip-dir-1.0.0" = self.by-version."zip-dir"."1.0.0";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  "jpm" = self.by-version."jpm"."1.0.0";
  by-spec."jpm-core"."0.0.9" =
    self.by-version."jpm-core"."0.0.9";
  by-version."jpm-core"."0.0.9" = self.buildNodePackage {
    name = "jpm-core-0.0.9";
    version = "0.0.9";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/jpm-core/-/jpm-core-0.0.9.tgz";
      name = "jpm-core-0.0.9.tgz";
      sha1 = "d835a72778b4dcb103e4fcdb6ff900e0e2dfc79b";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."jsonfile"."^2.0.0" =
    self.by-version."jsonfile"."2.0.1";
  by-version."jsonfile"."2.0.1" = self.buildNodePackage {
    name = "jsonfile-2.0.1";
    version = "2.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/jsonfile/-/jsonfile-2.0.1.tgz";
      name = "jsonfile-2.0.1.tgz";
      sha1 = "4d78eb5d7986539e4c9fe52c0b55ffacacb85bd3";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."jsontoxml"."0.0.11" =
    self.by-version."jsontoxml"."0.0.11";
  by-version."jsontoxml"."0.0.11" = self.buildNodePackage {
    name = "jsontoxml-0.0.11";
    version = "0.0.11";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/jsontoxml/-/jsontoxml-0.0.11.tgz";
      name = "jsontoxml-0.0.11.tgz";
      sha1 = "373ab5b2070be3737a5fb3e32fd1b7b81870caa4";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."jszip"."^2.4.0" =
    self.by-version."jszip"."2.5.0";
  by-version."jszip"."2.5.0" = self.buildNodePackage {
    name = "jszip-2.5.0";
    version = "2.5.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/jszip/-/jszip-2.5.0.tgz";
      name = "jszip-2.5.0.tgz";
      sha1 = "7444fd8551ddf3e5da7198fea0c91bc8308cc274";
    };
    deps = {
      "pako-0.2.6" = self.by-version."pako"."0.2.6";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."lazystream"."~0.1.0" =
    self.by-version."lazystream"."0.1.0";
  by-version."lazystream"."0.1.0" = self.buildNodePackage {
    name = "lazystream-0.1.0";
    version = "0.1.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lazystream/-/lazystream-0.1.0.tgz";
      name = "lazystream-0.1.0.tgz";
      sha1 = "1b25d63c772a4c20f0a5ed0a9d77f484b6e16920";
    };
    deps = {
      "readable-stream-1.0.33" = self.by-version."readable-stream"."1.0.33";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."lodash"."2.4.1" =
    self.by-version."lodash"."2.4.1";
  by-version."lodash"."2.4.1" = self.buildNodePackage {
    name = "lodash-2.4.1";
    version = "2.4.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lodash/-/lodash-2.4.1.tgz";
      name = "lodash-2.4.1.tgz";
      sha1 = "5b7723034dda4d262e5a46fb2c58d7cc22f71420";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."lodash"."3.3.1" =
    self.by-version."lodash"."3.3.1";
  by-version."lodash"."3.3.1" = self.buildNodePackage {
    name = "lodash-3.3.1";
    version = "3.3.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lodash/-/lodash-3.3.1.tgz";
      name = "lodash-3.3.1.tgz";
      sha1 = "3b914d4a1bb27efcee076e0dfa58152018e2042e";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."lodash"."^3.5.0" =
    self.by-version."lodash"."3.9.3";
  by-version."lodash"."3.9.3" = self.buildNodePackage {
    name = "lodash-3.9.3";
    version = "3.9.3";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lodash/-/lodash-3.9.3.tgz";
      name = "lodash-3.9.3.tgz";
      sha1 = "0159e86832feffc6d61d852b12a953b99496bd32";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."lodash"."~3.2.0" =
    self.by-version."lodash"."3.2.0";
  by-version."lodash"."3.2.0" = self.buildNodePackage {
    name = "lodash-3.2.0";
    version = "3.2.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lodash/-/lodash-3.2.0.tgz";
      name = "lodash-3.2.0.tgz";
      sha1 = "4bf50a3243f9aeb0bac41a55d3d5990675a462fb";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."lodash"."~3.5.0" =
    self.by-version."lodash"."3.5.0";
  by-version."lodash"."3.5.0" = self.buildNodePackage {
    name = "lodash-3.5.0";
    version = "3.5.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/lodash/-/lodash-3.5.0.tgz";
      name = "lodash-3.5.0.tgz";
      sha1 = "19bb3f4d51278f0b8c818ed145c74ecf9fe40e6d";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."minimatch"."2.0.4" =
    self.by-version."minimatch"."2.0.4";
  by-version."minimatch"."2.0.4" = self.buildNodePackage {
    name = "minimatch-2.0.4";
    version = "2.0.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/minimatch/-/minimatch-2.0.4.tgz";
      name = "minimatch-2.0.4.tgz";
      sha1 = "83bea115803e7a097a78022427287edb762fafed";
    };
    deps = {
      "brace-expansion-1.1.0" = self.by-version."brace-expansion"."1.1.0";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."minimatch"."^2.0.1" =
    self.by-version."minimatch"."2.0.8";
  by-version."minimatch"."2.0.8" = self.buildNodePackage {
    name = "minimatch-2.0.8";
    version = "2.0.8";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/minimatch/-/minimatch-2.0.8.tgz";
      name = "minimatch-2.0.8.tgz";
      sha1 = "0bc20f6bf3570a698ef0ddff902063c6cabda6bf";
    };
    deps = {
      "brace-expansion-1.1.0" = self.by-version."brace-expansion"."1.1.0";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."mozilla-toolkit-versioning"."0.0.2" =
    self.by-version."mozilla-toolkit-versioning"."0.0.2";
  by-version."mozilla-toolkit-versioning"."0.0.2" = self.buildNodePackage {
    name = "mozilla-toolkit-versioning-0.0.2";
    version = "0.0.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/mozilla-toolkit-versioning/-/mozilla-toolkit-versioning-0.0.2.tgz";
      name = "mozilla-toolkit-versioning-0.0.2.tgz";
      sha1 = "90590e05d48dfdc35b63a22d0233a6cae7c277ff";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."mozilla-version-comparator"."1.0.2" =
    self.by-version."mozilla-version-comparator"."1.0.2";
  by-version."mozilla-version-comparator"."1.0.2" = self.buildNodePackage {
    name = "mozilla-version-comparator-1.0.2";
    version = "1.0.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/mozilla-version-comparator/-/mozilla-version-comparator-1.0.2.tgz";
      name = "mozilla-version-comparator-1.0.2.tgz";
      sha1 = "f86731e70c15d1ff5eb288d13b4db8d1e605f7fc";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."mute-stream"."~0.0.4" =
    self.by-version."mute-stream"."0.0.5";
  by-version."mute-stream"."0.0.5" = self.buildNodePackage {
    name = "mute-stream-0.0.5";
    version = "0.0.5";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/mute-stream/-/mute-stream-0.0.5.tgz";
      name = "mute-stream-0.0.5.tgz";
      sha1 = "8fbfabb0a98a253d3184331f9e8deb7372fac6c0";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."node-int64"."~0.3.0" =
    self.by-version."node-int64"."0.3.3";
  by-version."node-int64"."0.3.3" = self.buildNodePackage {
    name = "node-int64-0.3.3";
    version = "0.3.3";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/node-int64/-/node-int64-0.3.3.tgz";
      name = "node-int64-0.3.3.tgz";
      sha1 = "2d6e6b2ece5de8588b43d88d1bc41b26cd1fa84d";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."node-uuid"."~1.4.1" =
    self.by-version."node-uuid"."1.4.3";
  by-version."node-uuid"."1.4.3" = self.buildNodePackage {
    name = "node-uuid-1.4.3";
    version = "1.4.3";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/node-uuid/-/node-uuid-1.4.3.tgz";
      name = "node-uuid-1.4.3.tgz";
      sha1 = "319bb7a56e7cb63f00b5c0cd7851cd4b4ddf1df9";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."node-watch"."0.3.4" =
    self.by-version."node-watch"."0.3.4";
  by-version."node-watch"."0.3.4" = self.buildNodePackage {
    name = "node-watch-0.3.4";
    version = "0.3.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/node-watch/-/node-watch-0.3.4.tgz";
      name = "node-watch-0.3.4.tgz";
      sha1 = "755f64ef5f8ad4acb5bafd2c4e7f4fb6a8db0214";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."once"."^1.3.0" =
    self.by-version."once"."1.3.2";
  by-version."once"."1.3.2" = self.buildNodePackage {
    name = "once-1.3.2";
    version = "1.3.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/once/-/once-1.3.2.tgz";
      name = "once-1.3.2.tgz";
      sha1 = "d8feeca93b039ec1dcdee7741c92bdac5e28081b";
    };
    deps = {
      "wrappy-1.0.1" = self.by-version."wrappy"."1.0.1";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."once"."~1.3.0" =
    self.by-version."once"."1.3.2";
  by-spec."open"."0.0.5" =
    self.by-version."open"."0.0.5";
  by-version."open"."0.0.5" = self.buildNodePackage {
    name = "open-0.0.5";
    version = "0.0.5";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/open/-/open-0.0.5.tgz";
      name = "open-0.0.5.tgz";
      sha1 = "42c3e18ec95466b6bf0dc42f3a2945c3f0cad8fc";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."pako"."~0.2.5" =
    self.by-version."pako"."0.2.6";
  by-version."pako"."0.2.6" = self.buildNodePackage {
    name = "pako-0.2.6";
    version = "0.2.6";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/pako/-/pako-0.2.6.tgz";
      name = "pako-0.2.6.tgz";
      sha1 = "3e0c548353b859ab9c8005fac706bdd6c7af505f";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."promzard"."0.3.0" =
    self.by-version."promzard"."0.3.0";
  by-version."promzard"."0.3.0" = self.buildNodePackage {
    name = "promzard-0.3.0";
    version = "0.3.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/promzard/-/promzard-0.3.0.tgz";
      name = "promzard-0.3.0.tgz";
      sha1 = "26a5d6ee8c7dee4cb12208305acfb93ba382a9ee";
    };
    deps = {
      "read-1.0.6" = self.by-version."read"."1.0.6";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."read"."1" =
    self.by-version."read"."1.0.6";
  by-version."read"."1.0.6" = self.buildNodePackage {
    name = "read-1.0.6";
    version = "1.0.6";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/read/-/read-1.0.6.tgz";
      name = "read-1.0.6.tgz";
      sha1 = "09873c14ecc114d063fad43b8ca5a33d304721c8";
    };
    deps = {
      "mute-stream-0.0.5" = self.by-version."mute-stream"."0.0.5";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."read"."1.0.5" =
    self.by-version."read"."1.0.5";
  by-version."read"."1.0.5" = self.buildNodePackage {
    name = "read-1.0.5";
    version = "1.0.5";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/read/-/read-1.0.5.tgz";
      name = "read-1.0.5.tgz";
      sha1 = "007a3d169478aa710a491727e453effb92e76203";
    };
    deps = {
      "mute-stream-0.0.5" = self.by-version."mute-stream"."0.0.5";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."readable-stream"."~1.0.2" =
    self.by-version."readable-stream"."1.0.33";
  by-version."readable-stream"."1.0.33" = self.buildNodePackage {
    name = "readable-stream-1.0.33";
    version = "1.0.33";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/readable-stream/-/readable-stream-1.0.33.tgz";
      name = "readable-stream-1.0.33.tgz";
      sha1 = "3a360dd66c1b1d7fd4705389860eda1d0f61126c";
    };
    deps = {
      "core-util-is-1.0.1" = self.by-version."core-util-is"."1.0.1";
      "isarray-0.0.1" = self.by-version."isarray"."0.0.1";
      "string_decoder-0.10.31" = self.by-version."string_decoder"."0.10.31";
      "inherits-2.0.1" = self.by-version."inherits"."2.0.1";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."readable-stream"."~1.0.24" =
    self.by-version."readable-stream"."1.0.33";
  by-spec."readable-stream"."~1.0.26" =
    self.by-version."readable-stream"."1.0.33";
  by-spec."readable-stream"."~1.0.33" =
    self.by-version."readable-stream"."1.0.33";
  by-spec."resolve"."^0.7.1" =
    self.by-version."resolve"."0.7.4";
  by-version."resolve"."0.7.4" = self.buildNodePackage {
    name = "resolve-0.7.4";
    version = "0.7.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/resolve/-/resolve-0.7.4.tgz";
      name = "resolve-0.7.4.tgz";
      sha1 = "395a9ef9e873fbfe12bd14408bd91bb936003d69";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."rimraf"."^2.2.8" =
    self.by-version."rimraf"."2.3.4";
  by-version."rimraf"."2.3.4" = self.buildNodePackage {
    name = "rimraf-2.3.4";
    version = "2.3.4";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/rimraf/-/rimraf-2.3.4.tgz";
      name = "rimraf-2.3.4.tgz";
      sha1 = "82d9bc1b2fcf31e205ac7b28138a025d08e9159a";
    };
    deps = {
      "glob-4.5.3" = self.by-version."glob"."4.5.3";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."sax"."0.6.x" =
    self.by-version."sax"."0.6.1";
  by-version."sax"."0.6.1" = self.buildNodePackage {
    name = "sax-0.6.1";
    version = "0.6.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/sax/-/sax-0.6.1.tgz";
      name = "sax-0.6.1.tgz";
      sha1 = "563b19c7c1de892e09bfc4f2fc30e3c27f0952b9";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."semver"."4.3.3" =
    self.by-version."semver"."4.3.3";
  by-version."semver"."4.3.3" = self.buildNodePackage {
    name = "semver-4.3.3";
    version = "4.3.3";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/semver/-/semver-4.3.3.tgz";
      name = "semver-4.3.3.tgz";
      sha1 = "15466b61220bc371cd8f0e666a9f785329ea8228";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."semver"."^2.3.1" =
    self.by-version."semver"."2.3.2";
  by-version."semver"."2.3.2" = self.buildNodePackage {
    name = "semver-2.3.2";
    version = "2.3.2";
    bin = true;
    src = fetchurl {
      url = "http://registry.npmjs.org/semver/-/semver-2.3.2.tgz";
      name = "semver-2.3.2.tgz";
      sha1 = "b9848f25d6cf36333073ec9ef8856d42f1233e52";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."string_decoder"."~0.10.x" =
    self.by-version."string_decoder"."0.10.31";
  by-version."string_decoder"."0.10.31" = self.buildNodePackage {
    name = "string_decoder-0.10.31";
    version = "0.10.31";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/string_decoder/-/string_decoder-0.10.31.tgz";
      name = "string_decoder-0.10.31.tgz";
      sha1 = "62e203bc41766c6c28c9fc84301dab1c5310fa94";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."tar-stream"."~1.1.0" =
    self.by-version."tar-stream"."1.1.5";
  by-version."tar-stream"."1.1.5" = self.buildNodePackage {
    name = "tar-stream-1.1.5";
    version = "1.1.5";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/tar-stream/-/tar-stream-1.1.5.tgz";
      name = "tar-stream-1.1.5.tgz";
      sha1 = "be9218c130c20029e107b0f967fb23de0579d13c";
    };
    deps = {
      "bl-0.9.4" = self.by-version."bl"."0.9.4";
      "end-of-stream-1.1.0" = self.by-version."end-of-stream"."1.1.0";
      "readable-stream-1.0.33" = self.by-version."readable-stream"."1.0.33";
      "xtend-4.0.0" = self.by-version."xtend"."4.0.0";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."tmp"."0.0.25" =
    self.by-version."tmp"."0.0.25";
  by-version."tmp"."0.0.25" = self.buildNodePackage {
    name = "tmp-0.0.25";
    version = "0.0.25";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/tmp/-/tmp-0.0.25.tgz";
      name = "tmp-0.0.25.tgz";
      sha1 = "b29629768c55f38df0bff33f6dfde052443da27d";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."when"."3.6.4" =
    self.by-version."when"."3.6.4";
  by-version."when"."3.6.4" = self.buildNodePackage {
    name = "when-3.6.4";
    version = "3.6.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/when/-/when-3.6.4.tgz";
      name = "when-3.6.4.tgz";
      sha1 = "473b517ec159e2b85005497a13983f095412e34e";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."when"."3.7.2" =
    self.by-version."when"."3.7.2";
  by-version."when"."3.7.2" = self.buildNodePackage {
    name = "when-3.7.2";
    version = "3.7.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/when/-/when-3.7.2.tgz";
      name = "when-3.7.2.tgz";
      sha1 = "06bed1296df3a0bfd83f7f31c5e1d779bd97eae8";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."winreg"."0.0.12" =
    self.by-version."winreg"."0.0.12";
  by-version."winreg"."0.0.12" = self.buildNodePackage {
    name = "winreg-0.0.12";
    version = "0.0.12";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/winreg/-/winreg-0.0.12.tgz";
      name = "winreg-0.0.12.tgz";
      sha1 = "07105554ba1a9d08979251d129475bffae3006b7";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."wrappy"."1" =
    self.by-version."wrappy"."1.0.1";
  by-version."wrappy"."1.0.1" = self.buildNodePackage {
    name = "wrappy-1.0.1";
    version = "1.0.1";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/wrappy/-/wrappy-1.0.1.tgz";
      name = "wrappy-1.0.1.tgz";
      sha1 = "1e65969965ccbc2db4548c6b84a6f2c5aedd4739";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."wrench"."~1.5.8" =
    self.by-version."wrench"."1.5.8";
  by-version."wrench"."1.5.8" = self.buildNodePackage {
    name = "wrench-1.5.8";
    version = "1.5.8";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/wrench/-/wrench-1.5.8.tgz";
      name = "wrench-1.5.8.tgz";
      sha1 = "7a31c97f7869246d76c5cf2f5c977a1c4c8e5ab5";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."xml2js"."~0.4.4" =
    self.by-version."xml2js"."0.4.9";
  by-version."xml2js"."0.4.9" = self.buildNodePackage {
    name = "xml2js-0.4.9";
    version = "0.4.9";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/xml2js/-/xml2js-0.4.9.tgz";
      name = "xml2js-0.4.9.tgz";
      sha1 = "d07cfdcb4d20b430478a5457bdcfc6ed621d884f";
    };
    deps = {
      "sax-0.6.1" = self.by-version."sax"."0.6.1";
      "xmlbuilder-2.6.4" = self.by-version."xmlbuilder"."2.6.4";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."xmlbuilder".">=2.4.6" =
    self.by-version."xmlbuilder"."2.6.4";
  by-version."xmlbuilder"."2.6.4" = self.buildNodePackage {
    name = "xmlbuilder-2.6.4";
    version = "2.6.4";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/xmlbuilder/-/xmlbuilder-2.6.4.tgz";
      name = "xmlbuilder-2.6.4.tgz";
      sha1 = "8123ac1576d9c66918f410496f1fe9f028b8ca3e";
    };
    deps = {
      "lodash-3.9.3" = self.by-version."lodash"."3.9.3";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."xtend"."^4.0.0" =
    self.by-version."xtend"."4.0.0";
  by-version."xtend"."4.0.0" = self.buildNodePackage {
    name = "xtend-4.0.0";
    version = "4.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/xtend/-/xtend-4.0.0.tgz";
      name = "xtend-4.0.0.tgz";
      sha1 = "8bc36ff87aedbe7ce9eaf0bca36b2354a743840f";
    };
    deps = {
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."zip-dir"."1.0.0" =
    self.by-version."zip-dir"."1.0.0";
  by-version."zip-dir"."1.0.0" = self.buildNodePackage {
    name = "zip-dir-1.0.0";
    version = "1.0.0";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/zip-dir/-/zip-dir-1.0.0.tgz";
      name = "zip-dir-1.0.0.tgz";
      sha1 = "efa7d916fd07a642dc8094869583721675b78768";
    };
    deps = {
      "jszip-2.5.0" = self.by-version."jszip"."2.5.0";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
  by-spec."zip-stream"."~0.5.0" =
    self.by-version."zip-stream"."0.5.2";
  by-version."zip-stream"."0.5.2" = self.buildNodePackage {
    name = "zip-stream-0.5.2";
    version = "0.5.2";
    bin = false;
    src = fetchurl {
      url = "http://registry.npmjs.org/zip-stream/-/zip-stream-0.5.2.tgz";
      name = "zip-stream-0.5.2.tgz";
      sha1 = "32dcbc506d0dab4d21372625bd7ebaac3c2fff56";
    };
    deps = {
      "compress-commons-0.2.9" = self.by-version."compress-commons"."0.2.9";
      "lodash-3.2.0" = self.by-version."lodash"."3.2.0";
      "readable-stream-1.0.33" = self.by-version."readable-stream"."1.0.33";
    };
    optionalDependencies = {
    };
    peerDependencies = [];
    os = [ ];
    cpu = [ ];
  };
}
