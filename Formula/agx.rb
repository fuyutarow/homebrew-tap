class Agx < Formula
  version "1.20.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.1/agx-1.20.1-darwin-arm64.tar.gz"
      sha256 "913044bfd3a7f406b5b9e21ac44cdc8414c8cb88e8be48d5e1baa57d7e6f3bad"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.1/agx-1.20.1-darwin-x64.tar.gz"
      sha256 "5b97d9cfe21773ab2300ba93b94dc10208d012a19b4eb174cd8ce7c45bccb048"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.1/agx-1.20.1-linux-arm64.tar.gz"
      sha256 "2c7cca85bb507ac5d2ce9ad70c65dc574d014849ff93dc5cd1df7cd93b3561e9"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.20.1/agx-1.20.1-linux-x64.tar.gz"
      sha256 "0d254eb788b3b62e01b907a95f256cba75d5d62d648f387351664cb1275c433e"
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
