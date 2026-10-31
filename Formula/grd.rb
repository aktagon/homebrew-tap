class Grd < Formula
  desc "Coordinator for the *grd linters: Claude Code hook dispatch, git hook audit"
  homepage "https://github.com/aktagon/grd"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aktagon/grd/releases/download/v0.3.0/grd-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "5e2925892442194e91d8503b429f7552442104ce09339797ecf497fb2422953f"
    end
    on_intel do
      url "https://github.com/aktagon/grd/releases/download/v0.3.0/grd-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "85e267ce9a416795dca04e30c60f83beeb25b7950524a45c8b11d4dea8150f74"
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
