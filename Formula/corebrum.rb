class Corebrum < Formula
  desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
  homepage "https://github.com/corebrum/corebrum"
  license "All Rights Reserved"
  version "0.2.183"







  def install
    binary = Dir["**/corebrum"].find { |f| File.file?(f) && File.executable?(f) }
    raise "Could not find corebrum binary" if binary.nil?
    bin.install binary
  end
  on_macos do
    if Hardware::CPU.intel?
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.183/corebrum-x86_64-apple-darwin.tar.xz"
      sha256 "e10b55bcacc0d51d76473b5e9e1eb9a6d9b1655f1db57174c36f1503a86a56a1"
    else
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.183/corebrum-aarch64-apple-darwin.tar.xz"
      sha256 "a1e36f6374557acaa58a73444993867d09fdaf778f270a5c9934471e8f474646"
    end
  end
end