class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "26.9.28"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.28/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "d553c4bf7318275f6d7f4e04ea0af0b37ec9c2479af648cc1035bdf2d99ca857"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.28/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "c46d538a37cb220aef351973aea235f88e1b4f405388eaa081d13a981f7c7935"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.28/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "223ff711217ac868ad72f2c43c2e39ef5982d15d9c704e7cbcf1d512cae7fd39"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.28/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47316dd090d52d3fc7f1ee8185b8fab09e4a69f1a6fd1cf8e083781e192383e6"
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
