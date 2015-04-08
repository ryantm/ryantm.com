{
  "coderay" = {
    version = "1.0.9";
    source = {
      type = "gem";
      sha256 = "1pbjsvd6r2daxd6aicp19fnb1j5z7fxadflsm1h0r33cy3vi7iy8";
    };
  };
  "ffi" = {
    version = "1.9.0";
    source = {
      type = "gem";
      sha256 = "0rnh9yyfzcpdmi8m7giyd21lgqj00afgxvgbx41hsi2ls1ghfwvy";
    };
  };
  "formatador" = {
    version = "0.2.4";
    source = {
      type = "gem";
      sha256 = "0pgmk1h6i6m3cslnfyjqld06a4c2xbbvmngxg2axddf39xwz6f12";
    };
  };
  "guard" = {
    version = "1.8.1";
    source = {
      type = "gem";
      sha256 = "18z2pmrgj16lrw4nmb2jagxcnn5l1jwhdmcpqmi929z83ggxk8fm";
    };
    dependencies = [
      "formatador"
      "listen"
      "lumberjack"
      "pry"
      "thor"
    ];
  };
  "guard-rake" = {
    version = "0.0.9";
    source = {
      type = "gem";
      sha256 = "1qy5i4yyd3n68a4wr3hq5apra5ggpk95chid87g4ch81cw980pmk";
    };
    dependencies = [
      "guard"
      "rake"
    ];
  };
  "guard-shell" = {
    version = "0.5.1";
    source = {
      type = "gem";
      sha256 = "1d478mv1lfszzmmfgxg63097x81mwvsvvqkwii9jshygsimsi425";
    };
    dependencies = [
      "guard"
    ];
  };
  "haml" = {
    version = "4.0.3";
    source = {
      type = "gem";
      sha256 = "1l9zhfdk9z7xjfdp108r9fw4xa55hflin7hh3lpafbf9bdz96knr";
    };
    dependencies = [
      "tilt"
    ];
  };
  "hpricot" = {
    version = "0.8.6";
    source = {
      type = "gem";
      sha256 = "1jn8x9ch79gqmnzgyz78kppavjh5lqx0y0r6frykga2b86rz9s6z";
    };
  };
  "libnotify" = {
    version = "0.8.0";
    source = {
      type = "gem";
      sha256 = "0lx2r979mm8g52fnj7c6mw09g4q1dqbwh2wx21xh00r2zmpszgzh";
    };
    dependencies = [
      "ffi"
    ];
  };
  "listen" = {
    version = "1.2.2";
    source = {
      type = "gem";
      sha256 = "1rj6w66n6cjjk3wvx42ll2w01n8mm6dyyma46jbncack56xgqhn1";
    };
    dependencies = [
      "rb-fsevent"
      "rb-inotify"
      "rb-kqueue"
    ];
  };
  "lumberjack" = {
    version = "1.0.3";
    source = {
      type = "gem";
      sha256 = "0qii3r669xrl0ja6z08a1xa2x2h2whikn72zm77x1svczxhkm5c8";
    };
  };
  "method_source" = {
    version = "0.8.1";
    source = {
      type = "gem";
      sha256 = "0pp9530x3rxbvr0h4liphaibq0hp2q0wfk12dax348km32v4cxwr";
    };
  };
  "pry" = {
    version = "0.9.12.2";
    source = {
      type = "gem";
      sha256 = "141slzb62zfzdhrygqjmrzh68s3vzrb4mwyipy2lhps5q4b46y9s";
    };
    dependencies = [
      "coderay"
      "method_source"
      "slop"
    ];
  };
  "rake" = {
    version = "10.0.4";
    source = {
      type = "gem";
      sha256 = "032z0csyi5bjfgzq3winvqvi9fpf3bfx518hzzapkfy90y702ds1";
    };
  };
  "rb-fsevent" = {
    version = "0.9.3";
    source = {
      type = "gem";
      sha256 = "0bdnxwdxj4r1kdxfi5nszbsb126njrr81p912g64xxs2bgxd1bp1";
    };
  };
  "rb-inotify" = {
    version = "0.9.0";
    source = {
      type = "gem";
      sha256 = "08qnb3ygr47knk190ynd45glis0iyngzi7maw3jrgs5kknc2bj9z";
    };
    dependencies = [
      "ffi"
    ];
  };
  "rb-kqueue" = {
    version = "0.2.0";
    source = {
      type = "gem";
      sha256 = "1f2wimhq93a1zy2fbyj7iyh7hvzmzwn3pzhkwb3npy4mj1df83n3";
    };
    dependencies = [
      "ffi"
    ];
  };
  "rb-readline" = {
    version = "0.5.2";
    source = {
      type = "gem";
      sha256 = "1wrlq19dix1zmjxvz1vmyddbl0bdk24smg9c266qdfvm9gcif91b";
    };
  };
  "ruby-prof" = {
    version = "0.13.0";
    source = {
      type = "gem";
      sha256 = "1bk5x52j18rby9m67b98jcvjqgispglsik4bjzv6zyyrlj9cf55r";
    };
  };
  "sass" = {
    version = "3.2.9";
    source = {
      type = "gem";
      sha256 = "08lvbi4siavvci0g4m65576axcagw23i0iamdqv33kwdimik717q";
    };
  };
  "slop" = {
    version = "3.4.5";
    source = {
      type = "gem";
      sha256 = "167bsdf24q1nkbad14yg5ibyvd5c71xxjsksky6rc00cr9y7r458";
    };
  };
  "thor" = {
    version = "0.18.1";
    source = {
      type = "gem";
      sha256 = "0d1g37j6sc7fkidf8rqlm3wh9zgyg3g7y8h2x1y34hmil5ywa8c3";
    };
  };
  "tilt" = {
    version = "1.4.1";
    source = {
      type = "gem";
      sha256 = "00sr3yy7sbqaq7cb2d2kpycajxqf1b1wr1yy33z4bnzmqii0b0ir";
    };
  };
}