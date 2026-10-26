class Agx < Formula
  version "1.13.9"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.9/agx-1.13.9-darwin-arm64.tar.gz"
      sha256 "ed1213e9f5d0fe900948280c4344a97b00a7c0a2789bd84cae7bd3c544464e7c"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.9/agx-1.13.9-darwin-x64.tar.gz"
      sha256 "a9a9293878921584b92f4e776777ac250bcce3e06ae9bd72f7307fb96367e8c9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.9/agx-1.13.9-linux-arm64.tar.gz"
      sha256 "1311347e6cf42f9d7601f0a758f27a8a153b85d075d9447163d32b4f70debd0f"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.13.9/agx-1.13.9-linux-x64.tar.gz"
      sha256 "c08195429bf7217a901a245f2b8a868a46e9c7ab08b4878e21e157204dbbbd35"
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
