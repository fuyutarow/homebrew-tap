class Agx < Formula
  version "1.14.5"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.5/agx-1.14.5-darwin-arm64.tar.gz"
      sha256 "29646fde3ac49bd21cbd1ed6cf617f4053e60110abd2289a1259ccda242aff9c"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.5/agx-1.14.5-darwin-x64.tar.gz"
      sha256 "44d749a3af4f49d681d706517af851dd5c53875a610a7c732fc3bf91ddb5494b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.5/agx-1.14.5-linux-arm64.tar.gz"
      sha256 "fb68025fd5d5af09d83bc812760a91db0ecc6cb8fec0a4dc73e137141ac427ab"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.5/agx-1.14.5-linux-x64.tar.gz"
      sha256 "123944efc7ff70732c59503711c8f13cc684b22824583df603d2e9c1000dd0cc"
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
