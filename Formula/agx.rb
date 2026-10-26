class Agx < Formula
  version "1.13.14"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.14/agx-1.13.14-darwin-arm64.tar.gz"
      sha256 "b5e94f0adcadd60747be47aabe47c3ae3a080476e95c0038b4f5ec1360a94f4b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.14/agx-1.13.14-darwin-x64.tar.gz"
      sha256 "19ea8a99ffad2feb5a3a44b9e3eb3960621ff7b7f6fc74c038aa2e3ad8ae11c0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.14/agx-1.13.14-linux-arm64.tar.gz"
      sha256 "af49e66c51ce2422ad421fabd76dfc3bd63bb0dbe042414234e6927f1a09a5b2"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.14/agx-1.13.14-linux-x64.tar.gz"
      sha256 "75d7fab9ce311e6483925e753672f712a4b2c024eb6ca5362b0aa4dd655bf531"
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
