class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.13.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.1/syntaqlite-macos-arm64.tar.gz"
      sha256 "421d152f8d54ddd81520c84cc110662ca8c0e45fb856a4bc81ed024ced8f9b72"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.1/syntaqlite-macos-x64.tar.gz"
      sha256 "8a519530868f6a268febf7938d498633fb3784265bfb7f6cbeadab7175f87186"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.1/syntaqlite-linux-arm64.tar.gz"
      sha256 "66438a0e93ef2a126c44a7b76e99cd92cdfed3ae831d17ed34ed7f1061384c5f"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.13.1/syntaqlite-linux-x64.tar.gz"
      sha256 "ddd292634af0aaa39ce909111f9ea9b9d63b45409249f57a46a6955e141b59da"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
