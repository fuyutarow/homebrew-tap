class Agx < Formula
  version "1.14.2"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.2/agx-1.14.2-darwin-arm64.tar.gz"
      sha256 "ffd7d553f487a9d926064141f1245764a5317ec4ec8fb421337d8bf37952bc9e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.2/agx-1.14.2-darwin-x64.tar.gz"
      sha256 "19fe82f221226aa962454d193560e59bc41ad73da06c8f70fde2ccaa68e1bdb1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.2/agx-1.14.2-linux-arm64.tar.gz"
      sha256 "d0dd57763c2aff928635e7458f21ffb8487750f4e7f926eb11e6c08eda4ef2a2"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.2/agx-1.14.2-linux-x64.tar.gz"
      sha256 "16a4a51573fb3e659edbc182ddc06ed35e660894d791ad48117772717de793d9"
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
