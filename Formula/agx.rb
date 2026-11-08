class Agx < Formula
  version "5.9.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.9.0/agx-5.9.0-darwin-arm64.tar.gz"
      sha256 "f62951331c1593c35450eceba9bc71b0bd5e30047958e9cf8b0669a39c3de3df"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.9.0/agx-5.9.0-darwin-x64.tar.gz"
      sha256 "cb8d90466de9714904f44d4ca3055da251cfdde58bc9bbfaed5509b9839d53af"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.9.0/agx-5.9.0-linux-arm64.tar.gz"
      sha256 "eba251251bd96b750b1563a96032c0c27b9e28ec23cf55d887c6cc25f0689bfe"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.9.0/agx-5.9.0-linux-x64.tar.gz"
      sha256 "52e48421ff91b0b79c439b1f4033de5a09cc4b6e109ca26f13a9f6484dcec4ce"
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
