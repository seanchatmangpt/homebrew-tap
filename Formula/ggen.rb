class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "26.9.21"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.21/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "0cbaaf6b9b780d9561d3f1ff9a607c8cd5cab75607b752e36241284297e3b955"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.21/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "5006dc8a6438d55e72585f189da6192dfb0367638ea58cd54878b19b0105576c"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.21/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e35abc8c05ed54f09840dd97074bf3042a6453938626a8609a396d33e4f969a6"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.21/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c8fbeeb6779e2e21d08809101268bb4c031dd3a6655bf9a3cb8d300dc2351aeb"
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
