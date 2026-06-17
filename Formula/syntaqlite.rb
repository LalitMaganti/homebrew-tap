class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.5.10"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.10/syntaqlite-macos-arm64.tar.gz"
      sha256 "5a9178faab7b0f1c423c988ac5329af2b29ee65672bff1e31e9a20a51900e89e"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.10/syntaqlite-macos-x64.tar.gz"
      sha256 "c8e456867e22735c162fe5d26919be108f16fcb7ee72b3321280975e9d0e2abe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.10/syntaqlite-linux-arm64.tar.gz"
      sha256 "100386c75a3ec359d1712c1f399b5fe4463ee02ebffb5183305387d852c3c3f8"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.10/syntaqlite-linux-x64.tar.gz"
      sha256 "b163a96ba6680b8dc38de2b679ca8e5ce178fc03764db10209c404c8191bd588"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
