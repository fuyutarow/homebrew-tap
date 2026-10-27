class Agx < Formula
  version "1.17.2"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.2/agx-1.17.2-darwin-arm64.tar.gz"
      sha256 "bf99979f447d6247d60ce94ea692f085b84f37ce681cfab0f824ca065de94216"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.2/agx-1.17.2-darwin-x64.tar.gz"
      sha256 "c3903e06a0563bb1d94db0619504a6be08be91ad7e610ffbf2c47a046ddcac3e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.2/agx-1.17.2-linux-arm64.tar.gz"
      sha256 "72a47507d7bfe2c23a399b0e35a2544bcf9adbdf5802cb4312990840ca7cd1f3"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.2/agx-1.17.2-linux-x64.tar.gz"
      sha256 "bc0101f30717fe021d8d5c92774973a75f815c3bab70389962a0df7d5c960b4a"
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
