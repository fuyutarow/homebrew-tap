class Agx < Formula
  version "11.2.3"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.2.3/agx-11.2.3-darwin-arm64.tar.gz"
      sha256 "4a05120d4e9cfc3b99bbe3fc9f3c43f34c366477524d9dde8c67bec81a6acc79"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.2.3/agx-11.2.3-darwin-x64.tar.gz"
      sha256 "9cb68c87b25a0da36d2d173599b25571a8a0bc7a7d486202032969ef9e04bb2d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v11.2.3/agx-11.2.3-linux-arm64.tar.gz"
      sha256 "1686abe394101480b5848c26e86e6658d8ac84c039f8863a211745e8bcf89059"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v11.2.3/agx-11.2.3-linux-x64.tar.gz"
      sha256 "1e4326de903e84245eb67fe9462a5287a0eec240dbca1a98b323ab9f73a72c30"
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
