class Agx < Formula
  version "5.1.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.1.0/agx-5.1.0-darwin-arm64.tar.gz"
      sha256 "b5f4506ce1b2c5d9283fe5a0a5eeb78a5da9f9bee6c82f8627fecb7a4eafd244"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.1.0/agx-5.1.0-darwin-x64.tar.gz"
      sha256 "92ee53008e270eae71f721e244f0ab601d70ab484a25226aae2d78406df6091b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.1.0/agx-5.1.0-linux-arm64.tar.gz"
      sha256 "06eba1cc7fe5febd511a02467939faedc6a505f28205c7ad3a47b2ee3ab79683"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.1.0/agx-5.1.0-linux-x64.tar.gz"
      sha256 "19bcd55490b9132d4382295150a4f2340b6821200278fce2765f3c217e988676"
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
