class Agx < Formula
  version "1.22.96"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.96/agx-1.22.96-darwin-arm64.tar.gz"
      sha256 "48f2b5f4fa06f597447e1704cd9164cfdec0423673290f2db2b5b27eef4486c1"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.96/agx-1.22.96-darwin-x64.tar.gz"
      sha256 "8c8262cf203371edb5dc00e5f37bd789262afbfaee9e4ebac23e9478566b1273"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.96/agx-1.22.96-linux-arm64.tar.gz"
      sha256 "6be3341c5b8dcd7d8aa9049f359c771f662ba9848d21d559d1a07011c1f6236e"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.96/agx-1.22.96-linux-x64.tar.gz"
      sha256 "cb24c6fd8b81d5b234ad1a81a0cb13354f15a4ee5a81e882b538338378e165b7"
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
