class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "0.2.1"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.1/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "46c5676004fddc26cc918dfbfcf296c730701e8113a07d091b1209253a70cfe6"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.1/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "77d129bb0544c73a33cd5a843b53a3efaab77b5ac2119455a1ace3218a257076"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.1/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "60df53065f7d16a128fc9c364dcb4fc86f31130868415d217fe08170e0574889"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.1/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ba3c0bfda74df1b6f2d0d423f8dd7e269f4232591e37605fe054fd3069c44a09"
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
