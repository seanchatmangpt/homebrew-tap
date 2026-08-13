class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "26.8.13"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.8.13/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "5db93c7191168df39a5bee6e7679752c0eabd445a0f0e76d073c8b5bb4989841"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.8.8/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "a4304371ce787e7bfe479fdba050960cdb8761fc9ca3d272da6bd7e64af08570"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.8.8/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c39d883b43aa6c635f5a490b7c203a1aaa6499e0df14b5d82d9dc4a26b8d22f6"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.8.8/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c651d873c2aeb6bd71c3d5356634f0b3f4adafd2454ee354c817a7079c2ea802"
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
