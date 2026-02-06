class Corebrum < Formula
  desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
  homepage "https://github.com/corebrum/corebrum"
  license "All Rights Reserved"
  version "0.2.216"










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
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.216/corebrum-x86_64-apple-darwin.tar.xz"
      sha256 "3588bfdba575e81f6ada7d6279dcb85f977990f949d1cd6532df22451b28a81c"
    else
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.216/corebrum-aarch64-apple-darwin.tar.xz"
      sha256 "858c960e6e1b974e63edfaad767cc48aa32eb339fffe4986cab3d67c372393e8"
    end
  end
end