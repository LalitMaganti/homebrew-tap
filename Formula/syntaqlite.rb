class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.5.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.5/syntaqlite-macos-arm64.tar.gz"
      sha256 "d5e57220e0ce9bb739c6aa7e893924a10f9fe326e9a218ac0e60bb018c79116f"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.5/syntaqlite-macos-x64.tar.gz"
      sha256 "cf15a890711ccfe3c7abd0ea24d5de9d63195c34a7d08d1edf2d866b6de22fa0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.5/syntaqlite-linux-arm64.tar.gz"
      sha256 "20229b57e032642d35d6e802cd6435ce2c583b20a15b218b885b915c2fe0c536"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.5.5/syntaqlite-linux-x64.tar.gz"
      sha256 "4accc6290640ced50d6bf9c7c40f37ca1d4b8895a8778754b7af4808ac98b50c"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
