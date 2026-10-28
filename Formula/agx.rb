class Agx < Formula
  version "1.21.2"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.2/agx-1.21.2-darwin-arm64.tar.gz"
      sha256 "5b8401a23392b4c633c9af7aedf320ee01efa42a9e3557596154579d0fc33843"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.2/agx-1.21.2-darwin-x64.tar.gz"
      sha256 "377089803fbad6d3d4b96ba1b4bf5f4f5a5c09e51a20c5539cb9c6474299ec0a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.2/agx-1.21.2-linux-arm64.tar.gz"
      sha256 "37b128d180e249c726c02dcc2cfb7c234577ab19fd221d15050cac9a29345eba"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.21.2/agx-1.21.2-linux-x64.tar.gz"
      sha256 "6c3931844360adacd6c8153f7779a63d31f5184df23d1e427862f1b743fa532f"
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
