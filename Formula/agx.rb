class Agx < Formula
  version "1.21.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.0/agx-1.21.0-darwin-arm64.tar.gz"
      sha256 "f6e555d9931c61f0f9ea41a206c2ce9072a07310338b1b29e3a157c69392ac53"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.0/agx-1.21.0-darwin-x64.tar.gz"
      sha256 "7ac387392f64c75da0082f2987d294fccda690444abc3eed66e9f095d0f73e00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.0/agx-1.21.0-linux-arm64.tar.gz"
      sha256 "16174178805352380efce4179c1b9cf184f329e113ed845fbba5eac079ade2f1"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.0/agx-1.21.0-linux-x64.tar.gz"
      sha256 "b9f03cde90a33db7cc44d9878830868dc138139323558c34b6b10996bc2473bf"
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
