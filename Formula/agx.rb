class Agx < Formula
  version "11.3.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.3.0/agx-11.3.0-darwin-arm64.tar.gz"
      sha256 "92e8317fb41ce661b3a501b632e8b8d06b7991870fb34111f5b297b75fedc3f7"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.3.0/agx-11.3.0-darwin-x64.tar.gz"
      sha256 "a3fa7930cff3010084d6a5706d5e2eeec9ef958c9e6d9138e7de076e0311be31"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.3.0/agx-11.3.0-linux-arm64.tar.gz"
      sha256 "ca1286e4ff5b6a31c160a4199e5d86bebc2d012380b17523ce0d966fabe40d66"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.3.0/agx-11.3.0-linux-x64.tar.gz"
      sha256 "17903dc63e09885d546ef0764b4604b701023f90c37fc174d83fa9b82fa7488a"
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
