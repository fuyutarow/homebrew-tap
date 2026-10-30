class Agx < Formula
  version "1.22.41"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.41/agx-1.22.41-darwin-arm64.tar.gz"
      sha256 "6cef6f807026798cd215bc8d7a873c2ee39db024a816af5a593e6d9e5c6d67fe"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.41/agx-1.22.41-darwin-x64.tar.gz"
      sha256 "d44614223b1c86613d8159de634718d43c6fa387e6089ba3c81016760a6d79d3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.41/agx-1.22.41-linux-arm64.tar.gz"
      sha256 "3e2f496ab78d4613206f8404f0f61d4ac5679683f896c1269e681ba01fc0cb07"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.41/agx-1.22.41-linux-x64.tar.gz"
      sha256 "3ae0fa4e36c054d05d1151d9c27374813840c27c6e5c10617f573e79403d5e1d"
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
