class Agx < Formula
  version "1.22.5"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.5/agx-1.22.5-darwin-arm64.tar.gz"
      sha256 "bc767b88a37e4633f9c3a99e7b92f29bcd99818b64cdce950c5863e8b23e3038"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.5/agx-1.22.5-darwin-x64.tar.gz"
      sha256 "cc1230683ee14472104606e8bd8539e7c27685676d85b53bd55efb3c823fa046"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.5/agx-1.22.5-linux-arm64.tar.gz"
      sha256 "797cbce5d5ef555769cfba0bcf5bd69a0c2e11562cc5347984b716d91987443c"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.5/agx-1.22.5-linux-x64.tar.gz"
      sha256 "acfa3d7eeb02c2f52aad62ca463983b4b76426b055e6e600baf367f6c5ae6d38"
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
