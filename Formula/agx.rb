class Agx < Formula
  version "1.22.82"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.82/agx-1.22.82-darwin-arm64.tar.gz"
      sha256 "65fb9520c932857151859e5a107de77e6711643b4e95d9eab79882d314ddce51"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.82/agx-1.22.82-darwin-x64.tar.gz"
      sha256 "1ff21f86d320de0c4ad54d814fbba76f15e0497d9b35979a3e1b59a1709b2362"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.82/agx-1.22.82-linux-arm64.tar.gz"
      sha256 "793bab4dee63a2dce2a28ff96617c7a8f8dde70b8e9843582e07fdcf43be5c71"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.82/agx-1.22.82-linux-x64.tar.gz"
      sha256 "72a44055b1a96e9bf14c74178ceabee10ee0e61a65428f3b39e5c5dd57cef337"
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
