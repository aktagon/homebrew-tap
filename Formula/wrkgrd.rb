class Wrkgrd < Formula
  desc "Verify code: runs a project's build and tests and reports only failures"
  homepage "https://github.com/aktagon/wrkgrd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.7.0/wrkgrd-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "ea4d9f1f141dd67e601c2acfb72172ab50b9a43f5724691537eacfb8b0c2394d"
    end
    on_intel do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.7.0/wrkgrd-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "5aa09a36a21242dfb5b138b9e045c0e5d09cb99253ab6b07f034f06883082eb5"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.7.0/wrkgrd-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "b01a195a90ef1682a95766e5bbbb75aed896f53e4d18d2ebf6f6803eaf2835b9"
    end
  end

  def install
    bin.install "wrkgrd"
  end

  test do
    assert_match "wrkgrd #{version}", shell_output("#{bin}/wrkgrd --version")
  end
end
