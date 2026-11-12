class Trtlgrd < Formula
  desc "Lint RDF graphs (Turtle, N-Triples) with a script-plugin rule harness"
  homepage "https://github.com/aktagon/trtlgrd"
  license "MIT"

  # The sha256 values are placeholders until the first release. The trtlgrd
  # release workflow rewrites them from the release's checksums.txt.
  on_macos do
    on_arm do
      url "https://github.com/aktagon/trtlgrd/releases/download/v0.2.1/trtlgrd-v0.2.1-aarch64-apple-darwin.tar.gz"
      sha256 "f984ef0fe6e83133856318db7a401c86ca329ac6bdaf5a36974a4b0ab3a69515"
    end
    on_intel do
      url "https://github.com/aktagon/trtlgrd/releases/download/v0.2.1/trtlgrd-v0.2.1-x86_64-apple-darwin.tar.gz"
      sha256 "2a28fc701c3420082028b0fa0a36978a84adbbdd3e650fb57d19cbfd4c35c48c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/trtlgrd/releases/download/v0.2.1/trtlgrd-v0.2.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "9fa177b48881adcbfd64dd570d021228010e462e2545ad65a2411942f89285cb"
    end
  end

  def install
    bin.install "trtlgrd"
  end

  test do
    assert_match "trtlgrd #{version}", shell_output("#{bin}/trtlgrd --version")
  end
end
