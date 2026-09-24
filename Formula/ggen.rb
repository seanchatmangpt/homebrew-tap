class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "26.9.23"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.23/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "0d96a7ea8fe73cbdd1115567c3d2ac8a2f7aa6a842454753073cc412d79dfd8c"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.23/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "7a03f5bb4a3b054fdc3d992fe4c213659a07df1268e2da250ccf76e349449c10"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.23/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "baba96993915c71b2ff4ef086bf77cc334ca884f66bdc588a10de092ac7e2bd5"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.23/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b3b64590ff612b40e1248a03b7b2dc3dcb19d2c373af74d5e64b3a0cba633af"
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
