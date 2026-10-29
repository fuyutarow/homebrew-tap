class Agx < Formula
  version "1.22.15"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.15/agx-1.22.15-darwin-arm64.tar.gz"
      sha256 "dadb567c0a48e492a5d484b91205bc4e4cab2c3396ea0904f5cd9d7e5a20dcb0"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.15/agx-1.22.15-darwin-x64.tar.gz"
      sha256 "de3ee78821c04f175f8104e805cc0cf246917b534acadc2c5b2b08504fa5d0ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.15/agx-1.22.15-linux-arm64.tar.gz"
      sha256 "f2c627913f6c51b4098b48dce82a804b010de0f2ba84a923c5209d808aad3a7e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.15/agx-1.22.15-linux-x64.tar.gz"
      sha256 "eb8acc084533f816ffcc4f3fd5fa245de679cfce5d7482025d5ac766e19661c2"
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
