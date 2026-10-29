class Agx < Formula
  version "1.22.7"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.7/agx-1.22.7-darwin-arm64.tar.gz"
      sha256 "26ce24d1523c2d25441933abab484044be806e6035c854ffe958b6ee6a18e42c"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.7/agx-1.22.7-darwin-x64.tar.gz"
      sha256 "2bd9491c901d97c4aa822d467eb064e1dfc71565cd9cd634b44775243e55637b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.7/agx-1.22.7-linux-arm64.tar.gz"
      sha256 "83c125750779b25849975cd361b12785b18a80f640de74aafed36e41a27aeba1"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.7/agx-1.22.7-linux-x64.tar.gz"
      sha256 "d9afca114c708f51e224ada06d0efefecfd99a2057738e05a6e96accb60288ec"
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
