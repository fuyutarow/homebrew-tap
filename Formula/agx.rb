class Agx < Formula
  version "1.22.44"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.44/agx-1.22.44-darwin-arm64.tar.gz"
      sha256 "de94ca742311f12581db5f309957138d18ac60b195dfc4f7ee28b585d73b9f19"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.44/agx-1.22.44-darwin-x64.tar.gz"
      sha256 "61f5bf89f8557cbd45fbdfd6192b7c34a4976be100a012338e3da3098c860eea"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.44/agx-1.22.44-linux-arm64.tar.gz"
      sha256 "8bac57d6344eaa99ac6697627da8a7f32447159a22f03380ab4261ffd2bd5c87"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.44/agx-1.22.44-linux-x64.tar.gz"
      sha256 "0b94abd4e77864e13745b0714a8b1edcceca158e521f841c35ec7bbfba7cb40a"
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
