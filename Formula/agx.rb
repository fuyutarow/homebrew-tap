class Agx < Formula
  version "1.22.42"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.42/agx-1.22.42-darwin-arm64.tar.gz"
      sha256 "2d9bdbc7bc7bc998e2c288ca7baf247be58bbc633b87b19b17faf9e6bf85e35d"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.42/agx-1.22.42-darwin-x64.tar.gz"
      sha256 "143eada20ef66534ff63ce2f5e491506efd47e445f19740684cc22e124afae6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.42/agx-1.22.42-linux-arm64.tar.gz"
      sha256 "b07d959ecddb70dcceef31a865f1e2d7812215853c3cd2b9ebdce9a87ece647f"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.42/agx-1.22.42-linux-x64.tar.gz"
      sha256 "ebd40f9faabf14e98384f73d3796da7dba5e3a3f8fb7d1c8eb89911fc8667146"
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
