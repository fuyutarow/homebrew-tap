class Agx < Formula
  version "5.8.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.8.1/agx-5.8.1-darwin-arm64.tar.gz"
      sha256 "16e9ff48e181eda436d98be60d86a5c2692bb7cf48dc39a5dafaedb01074261f"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.8.1/agx-5.8.1-darwin-x64.tar.gz"
      sha256 "48632e63aa4ec3a6aaeb8ca8bb4820e2abbbcca81e216fcd082f284ca71a32e6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v5.8.1/agx-5.8.1-linux-arm64.tar.gz"
      sha256 "7e989fdf29aa65af62e6bf06a08525f3060ff3a9462d3a86b01a66886d9a3332"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v5.8.1/agx-5.8.1-linux-x64.tar.gz"
      sha256 "b4e7601d8b61d6acd3df77cf94550debee3d44bd2e90aa0333eaf6ff9419166d"
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
