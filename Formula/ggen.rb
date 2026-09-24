class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "26.9.22"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.22/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "5832a30d4d3b608a02596e20aa914e482ea393a0646bba2be78ca157af156826"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.22/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "73a47f3bbf4875f4b530d9e84260da723058d7faad70e7fc8e3e6c5523ae3674"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.22/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d694b513db67a0586baca75aff4414b3cf0030c3c2863c37be0d637f38c3fbb"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.22/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "57a6d3f6a254c9da9d58e50329b45865b9da76435576d0a1cccf7c757e16fa39"
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
