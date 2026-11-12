class Wrkgrd < Formula
  desc "Verify code: runs a project's build and tests and reports only failures"
  homepage "https://github.com/aktagon/wrkgrd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.8.0/wrkgrd-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "75cc225d6fbc637528437be93dc1bd177f10c1559e34307b2634cc1d0828dc4e"
    end
    on_intel do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.8.0/wrkgrd-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "71959b6c6bdf18a59cfeae6f2a9e43fc5a5b4520140ccd5596dfe2d0625ba0a4"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.8.0/wrkgrd-v0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fecbbd522c583e84916e38c859478c87d0a7aa27b7e1644e95bfe3f8a4c9e0d2"
    end
  end

  def install
    bin.install "wrkgrd"
  end

  test do
    assert_match "wrkgrd #{version}", shell_output("#{bin}/wrkgrd --version")
  end
end
