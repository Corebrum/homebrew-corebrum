class Corebrum < Formula
  desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
  homepage "https://github.com/corebrum/corebrum"
  license "All Rights Reserved"
  version "0.3.10"




















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
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.3.10/corebrum-x86_64-apple-darwin.tar.xz"
      sha256 "df5ee66f7995fdd19c6cd4675f78ba00fe6527b339439e62922107521c3214e9"
    else
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.3.10/corebrum-aarch64-apple-darwin.tar.xz"
      sha256 "323e7f35fa8432e781658809bb20b8807e15e976e943e910054d5371775f72ef"
    end
  end
end