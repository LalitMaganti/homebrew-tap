class Buildprof < Formula
  desc "Record Linux build processes and file access as a Perfetto trace"
  homepage "https://buildprof.lalitm.com"
  version "0.2.2"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.2/buildprof-aarch64-apple-darwin.tar.xz"
      sha256 "15a812fa79db9f4ee2e9ada858bb13258da72762a1847c97e949ad096c7bf0c9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.2/buildprof-x86_64-apple-darwin.tar.xz"
      sha256 "1949da7e64a9b9f99cc05cfb108a2e77f559d810c7e758d89cc83d2b8f84adb0"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.2/buildprof-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "1159b310a8c33c74d0969741777841dd6ffea241981ffc0aff85bcfc990d6cb7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.2/buildprof-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "f93b63c3983f1dfc40bbfd646ae06257a701230366db2753062453529631db01"
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
