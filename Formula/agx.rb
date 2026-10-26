class Agx < Formula
  version "1.14.9"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.9/agx-1.14.9-darwin-arm64.tar.gz"
      sha256 "cd7db72b1122e983e5602c7ec952b27a1015362767ebfcf367ba5c7a406722d7"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.9/agx-1.14.9-darwin-x64.tar.gz"
      sha256 "ab4cd89a8f7690f256e8a7303aaa51ea4fad5e8ab709ef4bec193cc94cab0a85"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.9/agx-1.14.9-linux-arm64.tar.gz"
      sha256 "660ac72a0a16956294b2692fbc54733cdf85830848af54b9097c027623985727"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.9/agx-1.14.9-linux-x64.tar.gz"
      sha256 "7f46f57888e24064f0a76e1834a0c1cf87d4243fda0fd5dc92f46ff8e08bb2bd"
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
