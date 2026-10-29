class Agx < Formula
  version "1.22.32"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.32/agx-1.22.32-darwin-arm64.tar.gz"
      sha256 "28d3eae4cbe311b4aab4f22ff56537c296906ddc08a21806ffee3e03833870b6"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.32/agx-1.22.32-darwin-x64.tar.gz"
      sha256 "3d98f7b1db21fa087edf49e167327dc419fa8bcba6b15d0ea4a7221014d7308b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.32/agx-1.22.32-linux-arm64.tar.gz"
      sha256 "30d84b5e5ebe53deb8b4005ed44a90548f0152db7a4f9c0d16aff33f230547e0"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.32/agx-1.22.32-linux-x64.tar.gz"
      sha256 "ee1e89650904d08d0e9155fd706a2b538f444f0047f52b8937cdcadac190de29"
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
