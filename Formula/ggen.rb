class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "0.2.4"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.4/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "cb616e5c3ecdd2cbd1badeb4e9e7859c1e5dcbd1d8a59f9a07047dc2bc9710c8"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.4/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "e86fed91987f4400aedac93feb42253edb5d44e9c7c79bee7af2f74c5ff3880b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.4/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "103ec3ec764f62c1a9d7cf728c13b418715713d3ecd02be6a502bbb946bdb7a3"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.4/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "386f4283acc49fb43a11feb6f24d50482ed407ea710ed15bfb90899af5249dbd"
    end
  end
  def install
    bin.install "ggen"
    generate_completions_from_executable(bin/"ggen", "completion")
  end
  test do
    assert_match "ggen", shell_output("#{bin}/ggen --version")
  end
end
