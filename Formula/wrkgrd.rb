class Wrkgrd < Formula
  desc "Verify code: runs a project's build and tests and reports only failures"
  homepage "https://github.com/aktagon/wrkgrd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.6.1/wrkgrd-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "1e76f5034d31b964f23f7960ce58e9d4b957f438c526e86985a990b4c6dbf46b"
    end
    on_intel do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.6.1/wrkgrd-v0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "348506d27bc71a48a9e918fe255a88ba880fddc095c468882734cd7fd6c9d15b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.6.1/wrkgrd-v0.6.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d22a22646dbb273c1747dfcf5f284cea777df03102a999d919b0c641adce86d5"
    end
  end

  def install
    bin.install "wrkgrd"
  end

  test do
    assert_match "wrkgrd #{version}", shell_output("#{bin}/wrkgrd --version")
  end
end
