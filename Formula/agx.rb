class Agx < Formula
  version "1.22.8"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.8/agx-1.22.8-darwin-arm64.tar.gz"
      sha256 "8bd5f99e94fa9f2cc38b8670e233af4bd40ce701bf17760475ccbb67e5f0350d"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.8/agx-1.22.8-darwin-x64.tar.gz"
      sha256 "137927729dbdccaa8b004303e4e65a92a9594cbf66b337fa35a914a2be81f678"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.8/agx-1.22.8-linux-arm64.tar.gz"
      sha256 "957f18b78d9092cc7f74b45390d2b21b79e05e6782b5134308c8503cb08e6aa9"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.8/agx-1.22.8-linux-x64.tar.gz"
      sha256 "be3c0419372465e23e18f44cbc04b21fb5a1db742e47a48ca923aded3ecdf67f"
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
