class Agx < Formula
  version "1.22.46"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.46/agx-1.22.46-darwin-arm64.tar.gz"
      sha256 "43141e973be8d4c4bcb32413ea97c68088aa79c866e8a787a086f7dbc9dd09be"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.46/agx-1.22.46-darwin-x64.tar.gz"
      sha256 "00019a018d8e1a2b78c6f7b0c89d6c1a9abdba115aa5090c316128b8d5123c93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.46/agx-1.22.46-linux-arm64.tar.gz"
      sha256 "e4ad708f0c6faf7feb0f27bd4b1d56fd7ed42760f2c7069cb102302521d8974f"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.46/agx-1.22.46-linux-x64.tar.gz"
      sha256 "1dbc17bee728226646fc578875767bb25991911020aed8b57905f8ae7c8b5e71"
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
