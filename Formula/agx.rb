class Agx < Formula
  version "1.22.77"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.77/agx-1.22.77-darwin-arm64.tar.gz"
      sha256 "ee3f12286fce06517a55c4d8d266e4ba5cb13889b767aacc95e98f480418f0b7"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.77/agx-1.22.77-darwin-x64.tar.gz"
      sha256 "2af37e92ac5367ed6de8aaf143f7ef233341bac8f5313cebed118328e5e9831a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.77/agx-1.22.77-linux-arm64.tar.gz"
      sha256 "d43e3bfe67c52ed56d4d2147f5145a6a13397d100dfcdafc814bd6fab586b3da"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.77/agx-1.22.77-linux-x64.tar.gz"
      sha256 "23d30bcd8b9cffb3c1a6d9517fa20d14f247e0c52b6c3d29a6e29bb97dd1d2e4"
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
