class Agx < Formula
  version "1.17.3"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.3/agx-1.17.3-darwin-arm64.tar.gz"
      sha256 "df7f086c84d65a5b3837d85063592f1b6c3e01f6a31b53d5220dd49b3974bd26"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.3/agx-1.17.3-darwin-x64.tar.gz"
      sha256 "4fb9fec7c4610e5c31d4fa166c69be0b35f9136881118d3cf2ece4ffbecf4e8c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.3/agx-1.17.3-linux-arm64.tar.gz"
      sha256 "40b1485b553ee8187a4354846f13cd654286a9588b1207b73e2e98f61a817a39"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.3/agx-1.17.3-linux-x64.tar.gz"
      sha256 "3e2c57d80cec7ca6e5195ea9632476525f6a6eeb7dbf54cd2b30ecb5fb93f170"
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
