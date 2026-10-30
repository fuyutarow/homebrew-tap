class Agx < Formula
  version "1.22.36"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.36/agx-1.22.36-darwin-arm64.tar.gz"
      sha256 "75889d773306d38f4787df435a3135a0302059fcbe2e5edd8e8c06625ee127d7"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.36/agx-1.22.36-darwin-x64.tar.gz"
      sha256 "f23360248bd4c7b7fa8829f910d7d83560599423107629ce0545c457edfe68f1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.36/agx-1.22.36-linux-arm64.tar.gz"
      sha256 "39a325394ebb35906212df04d8f60254d9e7f7f3c1d0f75fa8dd2c1c139d4471"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.36/agx-1.22.36-linux-x64.tar.gz"
      sha256 "4f5e84e9d998e652804db924daaeed291ece2caedf72c3599bc862c87bbb4ddf"
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
