class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "26.9.18"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.18/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "1d06d0490e4c2638081485b674cb43d9f14018f30a15160dc2c1865dd2706751"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.18/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "df931f44e7356a53983aa8e2d8ea72e989f0e3a6731c998a8eae95593aabacc7"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.18/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "776491b3971870fd91b4d8231c07677a21a91d1306873bccc8c1d075db61ea6a"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.18/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9f1d689d26c5628aa695ab775f3045387f54d17c07abb8383caf0ad88a5c09e4"
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
