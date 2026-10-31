class Wrkgrd < Formula
  desc "Verify code: runs a project's build and tests and reports only failures"
  homepage "https://github.com/aktagon/wrkgrd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.5.0/wrkgrd-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "42dd751771fbd77ea741995d5c76ff5a197dcdfb6cefcf3293e587d368b88e0c"
    end
    on_intel do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.5.0/wrkgrd-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "ef08bb5f294f0ae490081c5153dced9282edb042e95f6994d0aebc9012035138"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/wrkgrd/releases/download/v0.5.0/wrkgrd-v0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "1e3aae4e35d1a90f7258e10a6acf70e167ac032c30889b2587b40b7e1440c55f"
    end
  end

  def install
    bin.install "wrkgrd"
  end

  test do
    assert_match "wrkgrd #{version}", shell_output("#{bin}/wrkgrd --version")
  end
end
