class Agx < Formula
  version "1.14.0"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.0/agx-1.14.0-darwin-arm64.tar.gz"
      sha256 "4f4546cba036fb8bd9211c5848ad0a69eb4f23bd26751ca93611050067446438"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.0/agx-1.14.0-darwin-x64.tar.gz"
      sha256 "953f260ab881ad03b0cc617b0a3306eb558e650bed31405fde953571ecf29440"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.0/agx-1.14.0-linux-arm64.tar.gz"
      sha256 "24ea93a75ec273be9c405988ef660d9ba062d6f139b5e2c5dc94fdf6eb3d6095"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.14.0/agx-1.14.0-linux-x64.tar.gz"
      sha256 "5a4aaa3b4e9ccf471f25115c63c6b5deb9765a58bfcc72bcb9ccaf88f02419fa"
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
