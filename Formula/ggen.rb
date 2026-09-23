class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "26.9.20"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.20/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "4e59dd05f56a42506a11d7f51bd00d8ce105c48d6cd49f226f19e9c83b6b7bfb"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.20/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "ea934beee339d0255d1d651261e937d83f55305f93764b4bc102bc1ee0293f36"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.20/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fa4e24d3141229bae6d9b7ed20f9ee0ec3c26d01a6579ecde76bbcce766e43d1"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.20/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "47cfa01cb4093daf17dd0ccaac6b1db2b3e12be33147c655a2e036f60e12fc19"
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
