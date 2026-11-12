class Trtlgrd < Formula
  desc "Lint RDF graphs (Turtle, N-Triples) with a script-plugin rule harness"
  homepage "https://github.com/aktagon/trtlgrd"
  license "MIT"

  # The sha256 values are placeholders until the first release. The trtlgrd
  # release workflow rewrites them from the release's checksums.txt.
  on_macos do
    on_arm do
      url "https://github.com/aktagon/trtlgrd/releases/download/v0.2.0/trtlgrd-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/aktagon/trtlgrd/releases/download/v0.2.0/trtlgrd-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/trtlgrd/releases/download/v0.2.0/trtlgrd-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install "trtlgrd"
  end

  test do
    assert_match "trtlgrd #{version}", shell_output("#{bin}/trtlgrd --version")
  end
end
