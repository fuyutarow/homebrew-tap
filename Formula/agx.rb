class Agx < Formula
  version "1.17.4"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.4/agx-1.17.4-darwin-arm64.tar.gz"
      sha256 "e9231f460caecf76094d430be386aa03c84ad0f7a4822fd3ca7ad9e6434e5d14"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.4/agx-1.17.4-darwin-x64.tar.gz"
      sha256 "1c3091a7c78d959130b02b187afd3357ab9f991e1d52e61479cf63bd2c43290d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.4/agx-1.17.4-linux-arm64.tar.gz"
      sha256 "3d4e6cdff2352cd5189727e77ad41f476c59d6e8595405337918f63dd3a15c9c"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.4/agx-1.17.4-linux-x64.tar.gz"
      sha256 "53b15cf58ff51b63b9efc436d5bfa3a4f2685b47d778fba3e81c4c36ca5557c6"
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
