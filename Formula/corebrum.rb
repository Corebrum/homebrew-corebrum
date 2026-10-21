class Corebrum < Formula
  desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
  homepage "https://github.com/corebrum/corebrum"
  license "All Rights Reserved"
  version "0.3.12"






















  def install
    binary = Dir["**/corebrum"].find { |f| File.file?(f) && File.executable?(f) }
    raise "Could not find corebrum binary" if binary.nil?
    bin.install binary
    
    # Install dist directory to share (Homebrew convention, for web UI)
    dist_dir = Dir["**/dist"].find { |f| File.directory?(f) }
    if dist_dir
      (share/"corebrum").install dist_dir
    end
  end
  on_macos do
    if Hardware::CPU.intel?
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.3.12/corebrum-x86_64-apple-darwin.tar.xz"
      sha256 "96daf76c86be1a27117f14228b277962130eaa50a8725ae7f8fb67faf1670034"
    else
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.3.12/corebrum-aarch64-apple-darwin.tar.xz"
      sha256 "bc99b1f685c190e397c9d1466cf0cb442b1ebdc447dbac28a70726fd12580fd4"
    end
  end
end