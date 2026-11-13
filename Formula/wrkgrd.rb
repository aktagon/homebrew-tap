class Wrkgrd < Formula
  desc "Verify code: runs a project's build and tests and reports only failures"
  homepage "https://github.com/aktagon/wrkgrd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.8.1/wrkgrd-v0.8.1-aarch64-apple-darwin.tar.gz"
      sha256 "973a415c17b7194273f0a68cbc60cde89e7a1bb6e6d5d97491b3e813b6962c36"
    end
    on_intel do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.8.1/wrkgrd-v0.8.1-x86_64-apple-darwin.tar.gz"
      sha256 "2c7d3442274a0571d2e65293f6c022e86e560068aa04bec1c2aee159e8153391"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.8.1/wrkgrd-v0.8.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "a53b7d71f6986d2c010fe9d03612040a909365399f2040b9aa5e9a7f99083c36"
    end
  end

  def install
    bin.install "wrkgrd"
  end

  test do
    assert_match "wrkgrd #{version}", shell_output("#{bin}/wrkgrd --version")
  end
end
