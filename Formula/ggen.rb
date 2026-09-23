class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "26.9.17"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.17/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "062551618d820e628cf1df8be758180f78fd96723963e974103431477d241a19"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.17/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "7738b7c38196ce4d9ce46d33b7245b8dcaf044d7acc61267e50a228f4138722d"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.17/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9d45d1d07fca77a0c49bcb86054742630b5ff4b0b31db3ad88c89abaae990ead"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.17/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d18090e726bf51c960901219ffced21487ef9439f7e09e1bc8dc3ff8faeeeea9"
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
