class RustDev < Formula
  desc "Latest stable Rust through rustup, with wasm32 and the cargo tools Studio uses"
  homepage "https://github.com/aktagon/homebrew-tap"
  url "https://raw.githubusercontent.com/aktagon/homebrew-tap/bdabab45aaaf8e6676ffe91d658f8a95cf273ac8/rust-dev/rust-dev-setup"
  version "1.1.0"
  sha256 "9a6ac0d7fafa3f2d82b1494ee838170f6831c5c6f103069a3d50089a488de68b"

  depends_on "cargo-deny"
  depends_on "rustup"
  depends_on "trunk"
  depends_on "wasm-bindgen"

  # Homebrew's rust can't build for wasm32: its compiler refuses Rust's official
  # wasm32 standard library as "compiled by an incompatible version of rustc".
  # rustup installs both from the same release, so it is the one Rust here.
  conflicts_with "rust", because: "rustup installs Rust, and two Rusts mean two versions"

  def install
    inreplace "rust-dev-setup", "@RUSTUP_BIN@", formula_opt_bin("rustup").to_s
    bin.install "rust-dev-setup"
  end

  def caveats
    <<~EOS
      rustup keeps Rust in RUSTUP_HOME, ~/.rustup by default, so Homebrew can't
      install it. For one Rust per machine, as the admin:
        mkdir -p #{HOMEBREW_PREFIX}/var/rustup
        RUSTUP_HOME=#{HOMEBREW_PREFIX}/var/rustup rust-dev-setup
      Then give every user, in ~/.zshenv:
        export RUSTUP_HOME=#{HOMEBREW_PREFIX}/var/rustup RUSTUP_TOOLCHAIN=stable
        export PATH="#{formula_opt_bin("rustup")}:$PATH"
      RUSTUP_TOOLCHAIN=stable stops a project's rust-toolchain.toml from
      installing a second version. Rerun the admin step to update.
      Chrome's test driver is a cask: brew install --cask chromedriver
    EOS
  end

  test do
    assert_match "rust-dev-setup", shell_output("#{bin}/rust-dev-setup --help")
    refute_match "@RUSTUP_BIN@", (bin/"rust-dev-setup").read
  end
end
