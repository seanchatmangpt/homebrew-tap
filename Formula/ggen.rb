class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "0.2.3"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.3/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "72926aede7b30b142097f405e54dd8f865cc1c44bfe1e69f876b51824aa404d4"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.3/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "9bde7ec6385a6b4121cd4ee7ee3f7f30736624732b2f2fea2c180d54a62de5b2"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.3/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "93db2b916c86e2351434f3e7bbe3c1f39fe854034ffaec94def1b5a1f2837bea"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.3/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "04af504dc095c69c78967ef83a5e4925497250f569a77cd58da56e349890ff0d"
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
