class Agx < Formula
  version "1.22.35"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.35/agx-1.22.35-darwin-arm64.tar.gz"
      sha256 "9b0ceee920d9754448e383d1af213ebd9cefcffa115d118defe3e8fb34253e2d"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.35/agx-1.22.35-darwin-x64.tar.gz"
      sha256 "441361b17f69a631897fe37f752e25c130404729481e40794367339f468da37d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.35/agx-1.22.35-linux-arm64.tar.gz"
      sha256 "fb5f8bcb03cddcad7a9358fef41d6aa87be886f4ae74e48567ecd66a1fd791a3"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.35/agx-1.22.35-linux-x64.tar.gz"
      sha256 "be276d7e2b2437f8af5d9a8f1df6f172f1f60a43c17cd1790f8032d085ece913"
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
