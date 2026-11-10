class Agx < Formula
  version "10.1.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.1.0/agx-10.1.0-darwin-arm64.tar.gz"
      sha256 "63f469199cb1037781752d45950827b42a9c2a6076d3dad4fba230dcebd56fba"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.1.0/agx-10.1.0-darwin-x64.tar.gz"
      sha256 "18730f6ef5e66033ed84daf536a3376fb999425b847e44361725f1ee52f362ee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.1.0/agx-10.1.0-linux-arm64.tar.gz"
      sha256 "0af8ad454b1314211a3c3b1d4b529391036f27522cc53dfeabe5baccecf673c7"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.1.0/agx-10.1.0-linux-x64.tar.gz"
      sha256 "d935bcdad9111a397777b275e2f6bfa8d951c50259c3cae911a1d56021009224"
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
