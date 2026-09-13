class Buildprof < Formula
  desc "Records every process and file access in a build and shows it as an interactive timeline"
  homepage "https://buildprof.lalitm.com"
  version "0.2.6"
  if OS.mac?
    if Hardware::CPU.arm?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.6/buildprof-aarch64-apple-darwin.tar.xz"
      sha256 "5d3a4d97fc985af0f20a673ccd2d75e668dc752f9d4f5c76efdefc8eef8fa1de"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.6/buildprof-x86_64-apple-darwin.tar.xz"
      sha256 "966a6c158376a74e7fa9aa3345aeeaa180005f34ace230fcd85448be073ebb88"
    end
  end
  if OS.linux?
    if Hardware::CPU.arm?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.6/buildprof-aarch64-unknown-linux-gnu.tar.xz"
      sha256 "88a59d897a099f36637a8a4f8d095755e4f506f50018ed4dcb82d98ac47ef803"
    end
    if Hardware::CPU.intel?
      url "https://github.com/lalitmaganti/buildprof/releases/download/v0.2.6/buildprof-x86_64-unknown-linux-gnu.tar.xz"
      sha256 "ec3f998853ec955c094585ddc8a7db21c91cc8ae5ee27c7c9d9c0da23a58c2aa"
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
