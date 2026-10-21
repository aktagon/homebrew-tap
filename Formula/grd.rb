class Grd < Formula
  desc "Coordinator for the *grd linters: Claude Code hook dispatch, git hook audit"
  homepage "https://github.com/aktagon/grd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/grd/releases/download/v0.2.0/grd-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "c71bb49e2d21c181800bbb8723638fdf8b80d47e484df898f876e0fac1898ea7"
    end
    on_intel do
      url "https://github.com/aktagon/grd/releases/download/v0.2.0/grd-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "c92eb83685db215f49360d3ba96961f670dbc3779740b41c918af974665d0b45"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/aktagon/grd/releases/download/v0.2.0/grd-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ef0c5c014676c259db627af507c4fc62f8daca34d4581e64e79c3fc3a8f2e087"
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
