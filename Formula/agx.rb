class Agx < Formula
  version "1.22.63"
  desc "Agent task orchestration CLI"
  homepage "https://github.com/fuyutarow/agx"

  on_macos do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.63/agx-1.22.63-darwin-arm64.tar.gz"
      sha256 "90cee709cf7a8f008f720f01fd007aaf436c0b8ccc0f1f1ea8dafa77337bde3b"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.63/agx-1.22.63-darwin-x64.tar.gz"
      sha256 "f90bc50654b8058e1c29827e08afc18ae6b4d3703912ed683c7276a6bdbab63b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.63/agx-1.22.63-linux-arm64.tar.gz"
      sha256 "938b5c8415a87d0bfc4032d3f34b430c1ae5793f5503c7adcbcc0e2fb9e82b98"
    end
    on_intel do
      url "https://github.com/fuyutarow/agx/releases/download/v1.22.63/agx-1.22.63-linux-x64.tar.gz"
      sha256 "020bb07f768b5dbd706613708b17f17f0a36d464c2446702b77a97905c022b8e"
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
