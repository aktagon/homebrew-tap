class Wrkgrd < Formula
  desc "Verify code: runs a project's build and tests and reports only failures"
  homepage "https://github.com/aktagon/wrkgrd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.4.0/wrkgrd-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "dbde562b2424db30b01b99fb273646d54058b9d27adfa9b997d62dd318ddcf55"
    end
    on_intel do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.4.0/wrkgrd-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "75ad53a2c4d8ae6d3894c829e03a68fbde27f6ca98e0707d8ad6b1c24fb9f80a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.4.0/wrkgrd-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "5416be77ebcb62769b08a22d68972e0c497da44ab17a61f18c094123f5582c16"
    end
  end

  def install
    bin.install "wrkgrd"
  end

  test do
    assert_match "wrkgrd #{version}", shell_output("#{bin}/wrkgrd --version")
  end
end
