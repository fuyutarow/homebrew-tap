class Agx < Formula
  version "1.22.11"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.11/agx-1.22.11-darwin-arm64.tar.gz"
      sha256 "658037304ca5602a946d410e422c2bd4d653b19be71d751fe580fc0fdf778e52"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.11/agx-1.22.11-darwin-x64.tar.gz"
      sha256 "f28b5e9b314856ffb268887fc0c8531ddc81619769998b29e08b25dd1a76716a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.11/agx-1.22.11-linux-arm64.tar.gz"
      sha256 "4a5a0581ace211c904e6ecc3f40de4abefd3d9cbc99f994033d83c0faef89e18"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.11/agx-1.22.11-linux-x64.tar.gz"
      sha256 "47df66184b2cb66fad08434d7b416c5a893fad3ed1b5bd0cbea78c0a2c6bd4c2"
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
