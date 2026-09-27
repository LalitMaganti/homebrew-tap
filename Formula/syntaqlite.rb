class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.11.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.11.1/syntaqlite-macos-arm64.tar.gz"
      sha256 "a2b9b0d731cd4e5798b40fbd9ca55a4498ed20f5aedd1bf83bec9bbd8fbe84ab"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.11.1/syntaqlite-macos-x64.tar.gz"
      sha256 "152b037fb3531367be7604cb221ba5443a0f25a90f40ff5265ef2d4462735ccb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.11.1/syntaqlite-linux-arm64.tar.gz"
      sha256 "e31c4f94e854941d5b2fa05d70eaa63b83d44aca5fa487a83fa7b694a142990b"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.11.1/syntaqlite-linux-x64.tar.gz"
      sha256 "03fa4611ca512fe9d5d709b733ff918f6c4ebc6b5164e18bd7dba49f6dc4426e"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
