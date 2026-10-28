class Agx < Formula
  version "1.21.8"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.8/agx-1.21.8-darwin-arm64.tar.gz"
      sha256 "b94d1913c951ca750b244347e84d253265966d87c45790ac505161220b318b4e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.8/agx-1.21.8-darwin-x64.tar.gz"
      sha256 "759af5e48c81d1dcf16075a849cc8a223c8d0f72d4ee7c2683411616eacf894a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.8/agx-1.21.8-linux-arm64.tar.gz"
      sha256 "d2dae6e12eee05dfae7ad9d6a1f9c0ec0d4fc2e2e5bb4edbe01fc07d8fe4b548"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.8/agx-1.21.8-linux-x64.tar.gz"
      sha256 "deab80e846a3c6815a3b9244ebf80d269126e193ca1b02fa115e8eccd719817a"
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
