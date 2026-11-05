class Agx < Formula
  version "1.22.100"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.100/agx-1.22.100-darwin-arm64.tar.gz"
      sha256 "b52b17edf258ac6975f78b30e34afe3b55f082903f15700f12b5c71b6c14a449"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.100/agx-1.22.100-darwin-x64.tar.gz"
      sha256 "7b295072d7a45800f483ce2b9d0c2d2448c9fb5f7fe35ecd42788eda270a8ca1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.100/agx-1.22.100-linux-arm64.tar.gz"
      sha256 "b3a35e9b563c4220f2d3e97f82b9f01c046fd628134f49ed8711d30a04ce8be6"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.100/agx-1.22.100-linux-x64.tar.gz"
      sha256 "eca4161978253312a28245347f341b4f5e84a32f9b9a51b3c8e6fe50c200187e"
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
