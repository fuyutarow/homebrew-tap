class Agx < Formula
  version "11.1.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.1.0/agx-11.1.0-darwin-arm64.tar.gz"
      sha256 "4276717074e15aff69465451774ef2cb9d43e9a30375ab0a20ca9a1a2e2334bc"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.1.0/agx-11.1.0-darwin-x64.tar.gz"
      sha256 "32c0f221c6dd4cb13b9a8a99c4b8373bc1325a7e75b45d52f35099c786e03eaa"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.1.0/agx-11.1.0-linux-arm64.tar.gz"
      sha256 "776d7c7c3a062100cee358a542355f58cfb0bb3f7e96dbcf59690e9fbd7a8414"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.1.0/agx-11.1.0-linux-x64.tar.gz"
      sha256 "5b1c5343daffda2ef8a93edd8d0a6094439d3b7cbc76856765d81bc6f1c2866e"
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
