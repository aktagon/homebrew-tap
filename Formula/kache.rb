class Kache < Formula
  desc "Content-addressed build cache for Rust, used as Cargo's rustc-wrapper"
  homepage "https://github.com/kunobi-ninja/kache"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kunobi-ninja/kache/releases/download/v1.0.0/kache-aarch64-apple-darwin.tar.gz"
      sha256 "6d1be0079d0689a85fa04b7fed7eaa94f7e08259cafb8bd361a5c25c4c98c4a3"
    end
    on_intel do
      url "https://github.com/kunobi-ninja/kache/releases/download/v1.0.0/kache-x86_64-apple-darwin.tar.gz"
      sha256 "ae0792b17e1c5f2438b39be888896c20aaf006bef5959c44fa3bc5bc66d93b5b"
    end
  end

  def install
    bin.install "kache"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kache --version")
  end
end
