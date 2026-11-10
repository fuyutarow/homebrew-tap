class Agx < Formula
  version "10.5.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.5.0/agx-10.5.0-darwin-arm64.tar.gz"
      sha256 "05d775361873a2a5dac8224b6635cc416f21826d568d6c7d0c763e7fac48979e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.5.0/agx-10.5.0-darwin-x64.tar.gz"
      sha256 "c62e04e9b51c1e428a312a849b8b93e6ea299c0bdaaf7898a1d6f935c25aee99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v10.5.0/agx-10.5.0-linux-arm64.tar.gz"
      sha256 "9cb6511468f46d96c25ccf3f4f994f945a7fb4c9efaeef78c49a1f24f8c223d9"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v10.5.0/agx-10.5.0-linux-x64.tar.gz"
      sha256 "73c317322e49a277c20fbd137e8df9d1fa38ca6399da0f44000d04379598a4ae"
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
