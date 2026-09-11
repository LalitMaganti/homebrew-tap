class Buildprof < Formula
  desc "Records every process and file access in a build and shows it as an interactive timeline"
  homepage "https://buildprof.lalitm.com"
  version "0.2.5"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.5/buildprof-aarch64-apple-darwin.tar.xz"
      sha256 "dd4f3090caeedd04fc15c358443de6a697447fb59a30bb62134686be225088ed"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.5/buildprof-x86_64-apple-darwin.tar.xz"
      sha256 "c2c6018acbdbf03c960603ae2e209772b3086c3d8891be3c0a0d6222a179a191"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.5/buildprof-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "21c9821ad17f9dd261ff87cc182cdb9ebd1b7e69dff5aef8f64fc897e96df6f0"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.5/buildprof-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "88962b9ed2fcdd76dbc37f839fa3c0e66b2790f4c4770ed10bfa66ea62e3f279"
    end
  end
  license "Apache-2.0"

  BINARY_ALIASES = {
    "aarch64-apple-darwin":               {},
    "aarch64-unknown-linux-gnu":          {},
    "aarch64-unknown-linux-musl-dynamic": {},
    "aarch64-unknown-linux-musl-static":  {},
    "x86_64-apple-darwin":                {},
    "x86_64-unknown-linux-gnu":           {},
    "x86_64-unknown-linux-musl-dynamic":  {},
    "x86_64-unknown-linux-musl-static":   {},
  }.freeze

  def target_triple
    cpu = Hardware::CPU.arm? ? "aarch64" : "x86_64"
    os = OS.mac? ? "apple-darwin" : "unknown-linux-gnu"

    "#{cpu}-#{os}"
  end

  def install_binary_aliases!
    BINARY_ALIASES[target_triple.to_sym].each do |source, dests|
      dests.each do |dest|
        bin.install_symlink bin/source.to_s => dest
      end
    end
  end

  def install
    if OS.mac? && Hardware::CPU.arm?
      bin.install "buildprof"
    end
    if OS.mac? && Hardware::CPU.intel?
      bin.install "buildprof"
    end
    if OS.linux? && Hardware::CPU.arm?
      bin.install "buildprof"
    end
    if OS.linux? && Hardware::CPU.intel?
      bin.install "buildprof"
    end

    install_binary_aliases!

    # Homebrew will automatically install these, so we don't need to do that
    doc_files = Dir["README.*", "readme.*", "LICENSE", "LICENSE.*", "CHANGELOG.*"]
    leftover_contents = Dir["*"] - doc_files

    # Install any leftover files in pkgshare; these are probably config or
    # sample files.
    pkgshare.install(*leftover_contents) unless leftover_contents.empty?
  end
end
