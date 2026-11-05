class Agx < Formula
  version "1.22.104"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.104/agx-1.22.104-darwin-arm64.tar.gz"
      sha256 "b044d5672788ca9e9edbe1a37424c2f47bce439db4f48b849aceeee9ebc4811a"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.104/agx-1.22.104-darwin-x64.tar.gz"
      sha256 "1170403b5ee1f9445857d91ec852869671f4f26f2ca4739f53327f67f9d32a92"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.104/agx-1.22.104-linux-arm64.tar.gz"
      sha256 "5293fededf9091b45dd06cd8a33122e88eda681f53febaabfb93208e64ad113d"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.104/agx-1.22.104-linux-x64.tar.gz"
      sha256 "958d9224d2f6908652af48bef65bd839181e82b419b4c7bc3b0a5c0b948bf2ba"
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
