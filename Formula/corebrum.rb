class Corebrum < Formula
  desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
  homepage "https://github.com/corebrum/corebrum"
  license "All Rights Reserved"
  version "0.3.7"

















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
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.3.7/corebrum-x86_64-apple-darwin.tar.xz"
      sha256 "6526e81f4918f30b4412f2ae5d5727badf48703bb4723c3a66c3fa5e4d1baec7"
    else
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.3.7/corebrum-aarch64-apple-darwin.tar.xz"
      sha256 "7c3e3d3c0117b9797167ef06ea67c2e9eec9360619ae7db20582a9c4d9c57a92"
    end
  end
end