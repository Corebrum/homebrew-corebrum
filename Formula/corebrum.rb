# This is a template Homebrew formula for Corebrum
# Copy this to your homebrew-corebrum tap repository at Formula/corebrum.rb
# The GitHub Actions workflow will automatically update the version and checksums

class Corebrum < Formula
    desc "Unified Corebrum platform - daemon, CLI, and mesh operating system for decentralized computing"
    homepage "https://github.com/corebrum/corebrum"
    license "All Rights Reserved"
  
    on_macos do
        if Hardware::CPU.intel?
            url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.112/corebrum-x86_64-apple-darwin.tar.xz"
            sha256 "0787b0dfdec355ec2c7dba0d40fe02dcb01189d0c84c92758b376550da4e649c"
        else
            url "https://corebrum-releases.s3.amazonaws.com/releases/v0.2.112/corebrum-aarch64-apple-darwin.tar.xz"
            sha256 "21292d0734c291b75a997b595ccd31b108dbad05d4381428dd1e7dc8b6b90b1b"
        end
    end
  
    test do
      system "#{bin}/corebrum", "--version"
    end
  end
  