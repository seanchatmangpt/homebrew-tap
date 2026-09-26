class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "26.9.27"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.27/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "ff962494639d4d2e497337f9c76c804390806e2019541e0f02c09471e898c334"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.27/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "ac8124d01e2e3ac0fb29f3f8c77c95eb91a4a7edbc4fa63acc9a28e8efbf6b4b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.27/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2fe712bedc241d132f6f5d69040aca74b8bb484a2d4415c8dc791056f049429d"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.27/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0044e1b178e924b5789c6e5ee5c1049b20c01893b1f99ffdc4b5f39c24f1e551"
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
