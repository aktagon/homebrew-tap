class Wrkgrd < Formula
  desc "Verify code: runs a project's build and tests and reports only failures"
  homepage "https://github.com/aktagon/wrkgrd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.4.0/wrkgrd-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "8a7453edc60f5c9acea9697eee37962ee288f8ea4bbcb7dea94b494874b332c5"
    end
    on_intel do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.4.0/wrkgrd-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "3be98180d4de87ac78609cfde83d4665600bdaf9dc25fa2f012f6adf58863155"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.4.0/wrkgrd-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "2fdc6013aa541c3e3668fcc2452689915908318a0bc3896746538e3f24ecc9fa"
    end
  end

  def install
    bin.install "wrkgrd"
  end

  test do
    assert_match "wrkgrd #{version}", shell_output("#{bin}/wrkgrd --version")
  end
end
