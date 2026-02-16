class Corebrum < Formula
  desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
  homepage "https://github.com/corebrum/corebrum"
  license "All Rights Reserved"
  version "0.2.234"















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
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.234/corebrum-x86_64-apple-darwin.tar.xz"
      sha256 "a59ff7c0ae767e7114cc8c79f3d25affa69652b2517936b4689368c908344c04"
    else
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.234/corebrum-aarch64-apple-darwin.tar.xz"
      sha256 "9709c2280d3df551a50f8da15f35c9d5fa74c51dc8859b2537ad8b8c47157e76"
    end
  end
end