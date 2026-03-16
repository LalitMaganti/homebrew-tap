class Syntaqlite < Formula
  desc "Fast, accurate SQLite SQL formatter, validator, and language server"
  homepage "https://syntaqlite.com"
  version "0.0.35"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.35/syntaqlite-macos-arm64.tar.gz"
      sha256 "f0e5ab67cab57f1f24ad40941a51e351f8853408d35c7feead861f58bc4d0f83"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.35/syntaqlite-macos-x64.tar.gz"
      sha256 "0634f973d729368d043cec4acdf109ae265f09f1369e98543266dc9c309fcda1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.35/syntaqlite-linux-arm64.tar.gz"
      sha256 "c8fe0069a57a5bb671fde3835faf0335975a4cd8638e1134f2bd419602fce9b9"
    else
      url "https://github.com/LalitMaganti/syntaqlite/releases/download/v0.0.35/syntaqlite-linux-x64.tar.gz"
      sha256 "2c480f8384a93b09818bf9714fe1a5b9b23592c576680bba5b445818c7442a2c"
    end
  end

  def install
    bin.install "syntaqlite"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/syntaqlite --version")
  end
end
