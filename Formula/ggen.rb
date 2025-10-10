class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "0.2.4"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.4/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "6a7b7d4a669f6519a58c2eeca6a0e7930b7763c2cae895a0ac410ae9f256252f"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.4/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "50547558b9e1902e638dda148b481ff8c3241411014abc62b2595a6dd9b6441b"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.4/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bad66cc6b30053bb394b267b99c713dff5cd0fb91a4d26753571e47812be7e0b"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v0.2.4/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "004f679fb644f9b7eb839cc2f19149d0856b822cc422472fefbe33d1b658359f"
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
