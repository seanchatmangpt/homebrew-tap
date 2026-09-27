class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "26.9.28"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.28/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "15972c7ba3ef6fd501d7db79b32aea9f77cc91ec6287c926fc11fe035015f9be"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.28/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "8df162ea452e30cc3ae38f00372ffe977e5a760869bb7866e2f061a9fb4f650d"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.28/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "67a99006cd11b6e2800b0b57f8e5ae91d06c903120c2a713f8b7bdc04ec030e0"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.28/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f16cd32d230c344395bdcaab2d2a81ca9529b512d74feeba2ac70ee3de33c993"
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
