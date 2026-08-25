class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "26.8.24"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.8.24/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "78bc383a07c8655b47cca8d8317e68c5acfe7fc6c62fc7938cf9df0c8670b195"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.8.18/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "a005ed8ef64c544cf4f43555e62a1ec6be652be31086bf5db237af9b3068c028"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.8.18/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f0f714208ef0acd2d690fa8f3221ee3e8eec3077666dbd285fe71d764f261c02"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.8.18/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bf64d31f7dcb3c6eaaa03b3a23d9f4f1de8aa3fe53aa16fe62ce1d06fa109e38"
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
