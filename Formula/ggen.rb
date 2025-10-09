class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "0.2.2"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.2/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "32a977a013283ed9d360e0407e566b9710034e5f11fed90831fdabbe33ecd277"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.2/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "3727d460a6bc7aa762519ffd976ac5643cfab7e7da755b35e7e9f1ec0bf09169"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.2/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "41b84c5d1f87fdc4cf46c67d24d35670bf699908bc1cc49c25a0dd98fc090e5d"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.2/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "abe8a0c214df33b29818866c6ea616ea1454b1e558a0c98daa8ea3bbba598847"
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
