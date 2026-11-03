class Agx < Formula
  version "1.22.76"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.76/agx-1.22.76-darwin-arm64.tar.gz"
      sha256 "ff2fa01d50e3d23d2e814622ce5efd9cade62fed82d06de1202624b3d6b361e0"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.76/agx-1.22.76-darwin-x64.tar.gz"
      sha256 "4b84b8fb94bb49530fced86c050c1a143637b3df51f00d7b9522ab90ec2c69b2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.76/agx-1.22.76-linux-arm64.tar.gz"
      sha256 "16d073c5d69c834da62b31a25dba2d628245adc3ca02532c132d0f95f86bb385"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.76/agx-1.22.76-linux-x64.tar.gz"
      sha256 "09057b6a13ffcd910069c3172c6374467b7ce0560e87394aa88990483264d290"
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
