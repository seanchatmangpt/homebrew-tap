class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "26.9.24"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.24/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "de58ed0e49c6f039f6de2ba875c59c9559efcfe1a7e49e057d7194ea1892f370"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.24/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "9e9199db512dbc280dafa4ccd1f1c8518b345b7feb8b13958b68caee01bc7d55"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.24/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "614b80079c93c112da0af47b8da94147732dab7989a9009320fd3a26ca34f24b"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.24/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8a7f9dc9e09d74d9d25dd5cf5d1eea93f80d0a6043dae0c4e9e39d32707704f9"
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
