class Corebrum < Formula
  desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
  homepage "https://github.com/corebrum/corebrum"
  license "All Rights Reserved"
  version "0.3.8"


















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
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.3.8/corebrum-x86_64-apple-darwin.tar.xz"
      sha256 "234f06a89fa76aa7998739565471d24ac41da8b98e372444824f0bee139cf0c6"
    else
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.3.8/corebrum-aarch64-apple-darwin.tar.xz"
      sha256 "1225bbf01e1da5ea5f499bc5c0adce3cad00cd245a73c0c275f76936bea4ac4b"
    end
  end
end