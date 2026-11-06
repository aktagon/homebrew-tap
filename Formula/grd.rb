class Grd < Formula
  desc "Coordinator for the *grd linters: Claude Code hook dispatch, git hook audit"
  homepage "https://github.com/aktagon/grd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/grd/releases/download/v0.4.0/grd-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "980fb84be428a1130471bec04b8309c6da0e911b4a7989f8d83eb6263b1aa94d"
    end
    on_intel do
      url "https://github.com/aktagon/grd/releases/download/v0.4.0/grd-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "3d942332a3ac3798b8cff045d16fde23e3d441d0e26106d0b15021d0ed8aba27"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/grd/releases/download/v0.3.0/grd-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e7c6ae6eb0cb27132e0faf6a17649fb9ca2e998691173b09676cf3e363409d67"
    end
  end

  def install
    bin.install "grd"
  end

  def caveats
    <<~EOS
      To wire grd into Claude Code, run:
        grd doctor                    # report what is missing; writes nothing
        grd doctor --fix --harness    # write grd's hook entries and skill into ~/.claude
    EOS
  end

  test do
    assert_match "grd doctor", shell_output("#{bin}/grd doctor --help")
  end
end
