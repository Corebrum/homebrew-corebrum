class Corebrum < Formula
  desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
  homepage "https://github.com/corebrum/corebrum"
  license "All Rights Reserved"
  version "0.2.226"













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
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.226/corebrum-x86_64-apple-darwin.tar.xz"
      sha256 "0ff2330059da78f7cd705aff2285964a3478e5081040cdf948d9d8962e67043c"
    else
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.226/corebrum-aarch64-apple-darwin.tar.xz"
      sha256 "44c508bc82de885027f03f9dc8116ac36e34b480b472735f4ac4d2bf7c62c5a9"
    end
  end
end