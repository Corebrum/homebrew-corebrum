class Corebrum < Formula
  desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
  homepage "https://github.com/corebrum/corebrum"
  license "All Rights Reserved"
  version "0.2.132"

  on_macos do
    if Hardware::CPU.intel?
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.132/corebrum-x86_64-apple-darwin.tar.xz"
      sha256 "..."
    else
      url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.132/corebrum-aarch64-apple-darwin.tar.xz"
      sha256 "..."
    end
  end

  def install
    bin.install "corebrum"
  end

  test do
    system "#{bin}/corebrum", "--version"
  end
end
