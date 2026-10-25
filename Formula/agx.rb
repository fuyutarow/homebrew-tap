class Agx < Formula
  version "1.11.3"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.11.3/agx-1.11.3-darwin-arm64.tar.gz"
      sha256 "02bc0abede4372b19550ddc946a73ba4de19578dc7a24eb54e5462010c62a0ce"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.11.3/agx-1.11.3-darwin-x64.tar.gz"
      sha256 "dcf0c600a9e8b7a73f53021a3bcb423900eb70cb7295313860a5ce4cdf6cf66c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.11.3/agx-1.11.3-linux-arm64.tar.gz"
      sha256 "74e5a746084c307e5fe07836d52352ac8581bd6e20b687f667c553429ab3ec27"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.11.3/agx-1.11.3-linux-x64.tar.gz"
      sha256 "ac857fb8a7dbacb1c6ccca53ab91ac8bb4dac888dde9b3d946f9b688c6163327"
    end
  end

  def install
    bin.install Dir["bin/*"].reject { |path| File.basename(path) == "xmsg" }
    bin.install_symlink "agx-msg" => "xmsg"
  end

  test do
    assert_equal "agx #{version}", shell_output("#{bin}/agx -V").strip
  end
end
