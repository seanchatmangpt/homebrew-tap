class Ggen < Formula
  desc "Language-agnostic, graph-aware generator for reproducible projections"
  homepage "https://github.com/seanchatmangpt/ggen"
  version "26.9.19"
  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.19/ggen-aarch64-apple-darwin.tar.gz"
      sha256 "2e1f969fa5b5f7e779e3523ae9aabcfbca49797bc3c790d32662473cf7d92416"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.19/ggen-x86_64-apple-darwin.tar.gz"
      sha256 "304889fbffce619b1808542f9400defc5cc42856ab802258e713529f63c809b0"
    end
  end
  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.19/ggen-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "617bba0fdd284f6468e907fdc5a6601dec38b87b6c115857090968978fdc6f7f"
    else
      url "https://github.com/seanchatmangpt/ggen/releases/download/v26.9.19/ggen-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3be2506bee89bd9b9d7dce15aa758a61c380c22c78d1f3cdea57a45530f0acab"
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
