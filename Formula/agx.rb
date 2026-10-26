class Agx < Formula
  version "1.14.6"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.6/agx-1.14.6-darwin-arm64.tar.gz"
      sha256 "8a313fdb39382accdea0748e10e27e610593d19a8499356ac0485f690bdf62f4"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.6/agx-1.14.6-darwin-x64.tar.gz"
      sha256 "54fe729f76ce5ee13296aa86cd00a80ed91418caabd60413052946206f75373e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.6/agx-1.14.6-linux-arm64.tar.gz"
      sha256 "5d14b00c78c54e79dc0da0decd38dac204634c6068c366d08e4b54f4cf804473"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.6/agx-1.14.6-linux-x64.tar.gz"
      sha256 "8536c9e66fa1d4532705d452a0da009468be8af839230d89487230d1a124f5d5"
    end
  end

  def install
    executables = Dir["*"].select { |path| File.file?(path) && File.executable?(path) }
    if executables.empty?
      executables = Dir["bin/*"].select { |path| File.file?(path) && File.executable?(path) }
    end
    raise "no executables found in archive" if executables.empty?

    bin.install executables.reject { |path| File.basename(path) == "xmsg" }
    bin.install_symlink "agx-msg" => "xmsg"
  end

  test do
    assert_equal "agx #{version}", shell_output("#{bin}/agx -V").strip
  end
end
