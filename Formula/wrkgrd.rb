class Wrkgrd < Formula
  desc "Verify code: runs a project's build and tests and reports only failures"
  homepage "https://github.com/aktagon/wrkgrd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.6.1/wrkgrd-v0.6.1-aarch64-apple-darwin.tar.gz"
      sha256 "a63114e99041ffc7656b6619a7794a75229ebc11543e7ded4d5b702d744eef1b"
    end
    on_intel do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.6.1/wrkgrd-v0.6.1-x86_64-apple-darwin.tar.gz"
      sha256 "7ea1720a1085494b3d8bdfb26e6dda9fb9dcfb2027e277673721f6a595d05115"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.6.1/wrkgrd-v0.6.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "22b233dd9c96c37ef4ed878c841beba16bd98e9f08886b992fdde417818c1990"
    end
  end

  def install
    bin.install "wrkgrd"
  end

  test do
    assert_match "wrkgrd #{version}", shell_output("#{bin}/wrkgrd --version")
  end
end
