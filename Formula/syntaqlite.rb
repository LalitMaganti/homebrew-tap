class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.0.36"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.36/syntaqlite-macos-arm64.tar.gz"
      sha256 "4e7731f39ea22fa7b4952a592cd804fd1cc02038a662eb1358cbd519611376fb"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.36/syntaqlite-macos-x64.tar.gz"
      sha256 "41d84cbf1d157f3785791c33e237a127807568a32c7579343b03cabfa81485f9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.36/syntaqlite-linux-arm64.tar.gz"
      sha256 "10f7ef5b6104ba18b09fadf5ce9c82ad9ab149aff24d255f79eaac5cc48fe875"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.36/syntaqlite-linux-x64.tar.gz"
      sha256 "5e02d5d003869a20c3e05dd4a360c9d9111b0dcd837a5d67c8a986dd82c8aef7"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
