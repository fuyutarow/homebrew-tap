class Agx < Formula
  version "1.17.1"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.1/agx-1.17.1-darwin-arm64.tar.gz"
      sha256 "bf052ea2592e477c00c925739605e3412bdbcd4805b78b5fa70477ca44148322"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.1/agx-1.17.1-darwin-x64.tar.gz"
      sha256 "9ce2e77a8e20dca353a9331b594992df59f9ea980036b9f3017997d60804b82a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.1/agx-1.17.1-linux-arm64.tar.gz"
      sha256 "8e90af34d7fac8448136662659e861b9a410e0b5a1514dc292276c9aff9d3e44"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.17.1/agx-1.17.1-linux-x64.tar.gz"
      sha256 "c4cd41887ad9d88f7e781031feba416008331f5ef000359ab57dbf85028240aa"
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
