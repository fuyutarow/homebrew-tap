class Agx < Formula
  version "1.22.56"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.56/agx-1.22.56-darwin-arm64.tar.gz"
      sha256 "e6f852ee128f6041874955d42059a8a921700b9ebc1b3e7ff58f2292f8ec53dd"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.56/agx-1.22.56-darwin-x64.tar.gz"
      sha256 "0f9c687f21b243639da8133c56835824dd0dba1650e117a3212a5a3a279ee22d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.56/agx-1.22.56-linux-arm64.tar.gz"
      sha256 "9b7667b7daa7ebcf9d7a33d4c96f86786d35d85e90566eaa8b7306082b64e065"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.56/agx-1.22.56-linux-x64.tar.gz"
      sha256 "452718a582e90d2a07358a537b040c7808a06336c47a7e5d947f5558cc37cd74"
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
