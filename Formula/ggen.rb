class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "26.9.26"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.26/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "23b552402fec640c402ae3eb4267baf7c9e167306564e7d87b33b4b4c4cddd26"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.26/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "6a8177282569e67b429a6e495d5f8f20bdcf7f2927718885d758ca095de0c477"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.26/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e4484ffbbdf1f5279b2a9b39d925c797597ac92842d1952171579472e8461c6e"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.26/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "54c7467cf88f61c1b8cf5f97622d9fb90201c6af1a22fa16e303f7758f9ee523"
    end
  end
  def install
    bin.install "ggen"
    # No : the ggen CLI has no
    #  subcommand (verified:  -> unrecognized
    # subcommand), and executing the missing verb inside brew's sandbox
    # fails the whole install. Every tap install of >=26.9.13 broke on this
    # line; the binary pour alone is the formula's job.
  end
  test do
    assert_match "ggen", shell_output("#{bin}/ggen --version")
  end
end
