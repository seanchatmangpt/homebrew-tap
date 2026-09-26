class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "26.9.25"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.25/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "8bd151619c5bf0c6aca1ca2353d4f551f8e0edd34b42f0d74cd42817f417d1e3"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.25/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "3a451a1cdb4d4cda35a7047c1a1d97591379cb4c131fe3f56303eb5ffd2d90e7"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.25/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6b1571d3add632b56d6ab6db1e08de710cfac4bb0d1103f823dec15e1673d926"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.25/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e5a12bcd257e5eedc4ab764fa731ade9eeb2c2419dbd5ad413bb93babcc7b618"
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
